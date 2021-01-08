import { STORAGE_LOCATIONS } from './../../environments/environment';
import {AngularFireAuth } from '@angular/fire/auth';
import { AngularFireStorage } from '@angular/fire/storage';
import {Observable} from 'rxjs';
import { User } from './../models/auth';
import { Injectable } from '@angular/core';
import { FileImage } from '../models/file';
import { finalize } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class AuthService {

  public userData$: Observable<firebase.User>;
  private filePath: string;

  constructor(private afAuht: AngularFireAuth, private storage: AngularFireStorage) {
    this.userData$ = afAuht.authState;
  }


  login(user: User)  {
    const{ email, password} = user;
    return this.afAuht.auth.signInWithEmailAndPassword(email, password);
  }

  register(email: string, password: string) {
    return this.afAuht.auth.createUserWithEmailAndPassword(email, password);
  }

  resetEmail(email: string) {
    return this.afAuht.auth.sendPasswordResetEmail(email);
  }

  async changeEmail(email: string) {
   await this.register(email , STORAGE_LOCATIONS.TEMP_PASS);
   await this.resetEmail(email);
  }

  logout() {
    this.afAuht.auth.signOut();
  }

  addOrUpdate(user: User, image?: FileImage): void {
    if (image) {
      this.uploadImage(user, image);
    } else {
      this.saveUserProfile(user);
    }
  }

  private uploadImage(user: User, image: FileImage): void {
    this.filePath = `images/${image.name}`;
    const fileRef = this.storage.ref(this.filePath);
    const task = this.storage.upload(this.filePath, image);
    task.snapshotChanges()
      .pipe(
        finalize(() => {
          fileRef.getDownloadURL().subscribe(urlImage => {
            user.photoURL = urlImage;
            this.saveUserProfile(user);
          });
        })
      ).subscribe();
  }

  private saveUserProfile(user: User) {
    this.afAuht.auth.currentUser.updateProfile({
      displayName: user.displayName,
      photoURL: user.photoURL
    })
      .then(() => console.log('User updated!'))
      .catch(err => console.log('Error', err));
  }




}
