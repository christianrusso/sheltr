import { Router } from '@angular/router';
import { AuthService } from './../../../services/auth.service';
import { Component, OnInit } from '@angular/core';
import { User } from '../../../models/auth';
import {FormGroup, FormControl, Validators} from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {


  loginForm = new FormGroup({
    email: new FormControl('', Validators.required),
    password: new FormControl('', Validators.required)
  });


  constructor(private authSvc: AuthService, private route: Router, private toastr: ToastrService) { }

  ngOnInit() {


  }
  onLogin(form: User) {

    this.authSvc.login(form)
    .then( res => {
      // console.log('success', res);
      this.route.navigate(['/dashboard']);
    })
    .catch(err => {

      let message: string;
        // console.log(err);
        switch (err.code) {
          case 'auth/user-not-found':
            message = 'Usuario incorrecto, verifique su usuario';
            break;
          case 'auth/wrong-password':
            message = 'Contraseña Incorrecta , verifique su contraseña';
            break;
        }

        Swal.fire(
          'Error!',
          message,
          'error'
        );


    });
}
}
