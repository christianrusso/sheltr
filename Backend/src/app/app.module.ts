import { NewUserComponent } from '../app/components/pages/user-profile/new-user/new-user.component';
import { EditUserComponent } from './components/pages/user-profile/edit-user/edit-user.component';

import { environment } from './../environments/environment';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ToastrModule } from 'ngx-toastr';

import { AppRoutingModule } from './app.routing';
import { ComponentsModule } from './components/components.module';

import { AppComponent } from './app.component';

import { AdminLayoutComponent } from '../app/components/pages/layouts/admin-layout/admin-layout.component';

/*Firebase */

import {AngularFirestoreModule} from '@angular/fire/firestore';
import {AngularFireStorageModule, StorageBucket} from '@angular/fire/storage';
import {AngularFireModule} from '@angular/fire';
import {AngularFireAuthModule} from '@angular/fire/auth';

import {MaterialModule} from './matreial.module';
import { LoginComponent } from './components/auth/login/login.component';
import { ReactiveFormsModule } from '@angular/forms';
import { ModalComponent } from './shared/components/modal/modal.component';







@NgModule({
  imports: [
    BrowserAnimationsModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    ComponentsModule,
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFireStorageModule,
    AngularFirestoreModule,
    AngularFireAuthModule,
    RouterModule,
    AppRoutingModule,
    MaterialModule,
    NgbModule,
    ToastrModule.forRoot()
  ],
  declarations: [
    AppComponent,
    AdminLayoutComponent,
    LoginComponent,
    ModalComponent,
    NewUserComponent,
    EditUserComponent
  ],
  entryComponents: [ModalComponent],
  providers: [
    {provide: StorageBucket, useValue: 'gs://sheltr-f785f.appspot.com'}
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
