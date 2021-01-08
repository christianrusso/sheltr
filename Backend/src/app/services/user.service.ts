import { async } from '@angular/core/testing';
import { STORAGE_LOCATIONS } from './../../environments/environment';
import { AuthService } from './auth.service';
import { Users, TipoUsuario } from './../models/user';
import { AngularFirestore, AngularFirestoreCollection} from '@angular/fire/firestore';
import { Injectable } from '@angular/core';
import {Observable} from 'rxjs';
import {finalize, map} from 'rxjs/operators';
import { FileImage } from '../models/file';
import { AngularFireStorage } from '@angular/fire/storage';




@Injectable({
  providedIn: 'root'
})
export class UserService {
  private usersCollection: AngularFirestoreCollection;
  private filePath: any;
  private downloadURL: Observable<string>;

  constructor(private afs: AngularFirestore , private storage: AngularFireStorage, private authSvc: AuthService) {
    this.usersCollection = afs.collection<Users>('Users');
  }

  public getAll(): Observable<Users[]> {

    return this.usersCollection
      .snapshotChanges()
      .pipe(
        map(action =>
          action.map( a => {

            const data = a.payload.doc.data() as Users;
            const id = a.payload.doc.id;
            return {id, ...data};
          })
        )
      );
  }

  public getUserByID(id: Users) {
    return this.afs.doc<Users>(`Users/${id}`).valueChanges();
  }

  public deleteUser(user: Users) {
    return this.usersCollection.doc(user.id).delete();
  }

  public addOrUpdate(user: Users, image?: FileImage) {

    if (!image) {
      this.saveUser(user);
    } else {
      this.uploadImage(user, image);
    }

  }

  private  saveUser (user: Users)  {

    const userObj = {
      id: '',
      Nombre: user.Nombre,
      Email: user.Email,
      Imagen: this.downloadURL,
      TipoUsuario: user.TipoUsuario
    };
    if (user.id) {
      if (this.downloadURL) {
        user.Imagen = this.downloadURL;
      }
      const useremail = this.afs.doc<Users>(`Users/${user.id}`).valueChanges();

      useremail.subscribe(res => {
          if (res.Email !== user.Email) {
            this.authSvc.changeEmail(user.Email);
          }
      });

      return this.usersCollection.doc(user.id).update(user);

    } else {
      this.authSvc.register(userObj.Email, STORAGE_LOCATIONS.TEMP_PASS).then(res => {
        userObj.id = res.user.uid;
        console.log(res);
        console.log('reset to email', res.user.email);
        this.authSvc.resetEmail(res.user.email).then( send => {
          console.log('reset to email');
          console.log(send);
        }).catch(err => {
          console.log(err);
        });
        return this.usersCollection.doc(userObj.id).set({
          id: userObj.id,
          Nombre: userObj.Nombre,
          Email: userObj.Email,
          Imagen: userObj.Imagen,
          TipoUsuario: userObj.TipoUsuario
        });

      });

    }

  }

  private uploadImage(user: Users, image: FileImage) {

    this.filePath = `images/${image.name}`;
    const fileRef = this.storage.ref(this.filePath);
    const task = this.storage.upload(this.filePath, image);
    task.snapshotChanges()
    .pipe(
      finalize(() => {
        fileRef.getDownloadURL().subscribe( urlImage => {
          this.downloadURL = urlImage;
          this.saveUser(user);
        });
      })
    ).subscribe();
  }


}
