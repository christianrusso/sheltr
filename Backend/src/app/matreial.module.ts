import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import {MatButtonModule} from '@angular/material/button';
import {MatInputModule} from '@angular/material/input';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatTooltipModule} from '@angular/material/tooltip';
import {MatSelectModule} from '@angular/material/select';
import {MatCardModule} from '@angular/material/card';
import {MatMenuModule} from '@angular/material/menu';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatSidenavModule} from '@angular/material/sidenav';
import {MatIconModule} from '@angular/material/icon';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatDividerModule} from '@angular/material/divider';
import {MatChipsModule} from '@angular/material/chips';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatSortModule} from '@angular/material/sort';
import {MatDialogModule} from '@angular/material/dialog';


    const modulos = [ MatButtonModule, MatCardModule , MatMenuModule , MatInputModule,
        MatFormFieldModule, MatTooltipModule, MatSelectModule , MatToolbarModule ,
        MatSidenavModule , MatIconModule , MatProgressSpinnerModule , MatDividerModule, MatChipsModule,
        MatTableModule, MatPaginatorModule , MatSortModule, MatDialogModule , MatSelectModule];

      @NgModule({
        declarations: [
        ],
        imports: [
          CommonModule,
          modulos
        ],
        exports: [
          modulos
        ]
      })
      export class MaterialModule { }
