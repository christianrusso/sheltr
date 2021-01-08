import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { FormGroup } from '@angular/forms';
import { User } from '../../../models/auth';
import { FileImage } from '../../../models/file';
import { AuthService } from '../../../services/auth.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  public image: FileImage;
  public currentImage = 'https://picsum.photos/id/113/150/150';

  constructor(private authSvc: AuthService) { }

  public profileForm = new FormGroup({
    displayName: new FormControl('', Validators.required),
    email: new FormControl({ value: '', disabled: true }, Validators.required),
    photoURL: new FormControl('', Validators.required),
  });

  ngOnInit() {
    this.authSvc.userData$.subscribe(user => {
      this.initValuesForm(user);
    });
  }

  onSaveUser(user: User): void {
    this.authSvc.addOrUpdate(user, this.image);
  }

  private initValuesForm(user: User): void {
    if (user.photoURL) {
      this.currentImage = user.photoURL;
    }

    this.profileForm.patchValue({
      displayName: user.displayName,
      email: user.email,
    });
  }

  handleImage(image: FileImage): void {
    this.image = image;
  }

}
