import { UserService } from './../../../../services/user.service';
import { Users } from './../../../../models/user';
import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, Validators } from '@angular/forms';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-new-user',
  templateUrl: './new-user.component.html',
  styleUrls: ['./new-user.component.scss']
})
export class NewUserComponent implements OnInit {

  private Image: any;

  public newUserForm = new FormGroup({
    Nombre: new FormControl('', Validators.required),
    Email: new FormControl('', Validators.required),
    Imagen: new FormControl('', Validators.required),
    TipoUsuario: new FormControl('', Validators.required)
  });

  constructor(private userSvc: UserService) { }

  ngOnInit(): void {
  }
  addNewUser(data: Users) {
      if(this.newUserForm.invalid){
        Swal.fire('Oops...', 'Todos los campos deben estar completo , para poder agregar un usuario!', 'error');
        return;
      }
    this.userSvc.addOrUpdate(data, this.Image);
  }
  handleImage(e: any): void {
    this.Image = e.target.files[0];
  }

}
