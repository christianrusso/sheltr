import { Users } from './../../../models/user';

import { Component, OnInit , ViewChild, AfterViewInit} from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {UserService} from '../../../services/user.service';
import Swal from 'sweetalert2';
import {MatDialog} from '@angular/material/dialog';
import {ModalComponent} from '../../../shared/components/modal/modal.component';


@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.scss']
})
export class UserProfileComponent implements OnInit, AfterViewInit {

  displayedColumns: string[] = ['Nombre', 'Email', 'TipoUsuario', 'Actions'];
  dataSource = new MatTableDataSource();

  @ViewChild(MatPaginator, { static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, { static: true}) sort: MatSort;


  constructor(private userSvc: UserService, public dialog: MatDialog) { }

  ngOnInit() {
    this.userSvc.getAll().subscribe(res => {
      this.dataSource.data = res; });
  }
  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }
  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  onDeleteUser(user: Users) {
    Swal.fire({
      title: 'Usted esta seguro?',
      text: 'Esta accion no se puede revertir!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, borrar!'
    }).then((result) => {
      if (result.isConfirmed) {
        this.userSvc.deleteUser(user)
        .then(() =>
          Swal.fire(
          'Borrar!',
          'Usuario borrardo exitosamente.',
          'success'
        ))
        .catch((erro => {
          Swal.fire(
            'Error!',
            'Ocurrio un error',
            'error'
          );
        }));
      }
    });

  }
  onEditUser(user: Users) {
    this.openDialog(user);
  }
  onNewUser() {
    this.openDialog();
  }
  openDialog(user?: Users): void {

    const config = {
      data: {
        message: user ? 'Editar Usuario' : 'Nuevo Usuario',
        content: user
      }
    };

    const dialogRef = this.dialog.open(ModalComponent, config);
    dialogRef.afterClosed().subscribe(result => { });

  }

}
