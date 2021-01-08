import { AuthGuard } from '../app/shared/guards/auth.guard';
import { NgModule, Component } from '@angular/core';
import { CommonModule, } from '@angular/common';
import { BrowserModule  } from '@angular/platform-browser';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './components/auth/login/login.component';
import { AdminLayoutComponent } from './components/pages/layouts/admin-layout/admin-layout.component';

const routes: Routes = [
  { path: '', component: LoginComponent },
  {
    path: '',
    canActivate: [
      AuthGuard
    ],
    component: AdminLayoutComponent,
    children: [{
      path: '',
      loadChildren: './components/pages/layouts/admin-layout/admin-layout.module#AdminLayoutModule'
    }]
  }
];

@NgModule({
  imports: [
    CommonModule,
    BrowserModule,
    RouterModule.forRoot(routes)
  ],
  exports: [
  ],
})
export class AppRoutingModule { }
