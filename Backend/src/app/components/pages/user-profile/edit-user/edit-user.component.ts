import { UserService } from './../../../../services/user.service';
import { Users, TipoUsuario } from './../../../../models/user';
import { Component, Input, OnInit } from '@angular/core';
import {FormGroup, FormControl, Validators } from '@angular/forms';

@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.component.html',
  styleUrls: ['./edit-user.component.scss']
})
export class EditUserComponent implements OnInit {
  private Image: any;
  private ImageOriginal: any;

  public editUserForm = new FormGroup({
    id: new FormControl('', Validators.required),
    Nombre: new FormControl('', Validators.required),
    Email: new FormControl('', Validators.required),
    Imagen: new FormControl('', Validators.required),
    TipoUsuario: new FormControl('', Validators.required),
  });

  @Input() user: Users;
  constructor(private userSvc: UserService) { }

  ngOnInit(): void {
    this.Image = this.user.Imagen;
    this.ImageOriginal = this.user.Imagen;
    this.initValues();
  }
  editUser(user: Users) {

    if (this.Image === this.ImageOriginal) {
        user.Imagen = this.ImageOriginal;
        this.userSvc.addOrUpdate(user);
    } else {
        this.userSvc.addOrUpdate(user, this.Image);
    }

  }
  handleImage(e: any): void {
    this.Image = e.target.files[0];
  }
  private initValues() {
    this.editUserForm.patchValue({
      id: this.user.id,
      Nombre: this.user.Nombre,
      Email: this.user.Email,
      TipoUsuario: this.user.TipoUsuario,
    });

  }

}
