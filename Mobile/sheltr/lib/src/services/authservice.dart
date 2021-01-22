import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:sheltr/src/model/user.dart';

enum AuthStatus {
  Uninitialized,
  Authenticated,
  Registred,
  //Authenticating,
  Unauthenticated
}

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth;
  User _user = new User();

  final Firestore _db = Firestore.instance;
  AuthStatus _status = AuthStatus.Uninitialized;

  AuthService.instance() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = AuthStatus.Unauthenticated;
    } else {
      DocumentSnapshot userSnap =
          await _db.collection('Users').document(firebaseUser.uid).get();

      _user.setFromFireStore(userSnap);
      _status = AuthStatus.Authenticated;
    }
    notifyListeners();
  }

  Future<FirebaseUser> firebaseSignIn(String email, String password) async {
    // _status = AuthStatus.Authenticating;
    // notifyListeners();

    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      DocumentSnapshot userSnap =
          await _db.collection('Users').document(user.uid).get();
      _user.setFromFireStore(userSnap);
      _status = AuthStatus.Authenticated;
      notifyListeners();

      return user;
    } catch (e) {
      print(e);
      _status = AuthStatus.Unauthenticated;
      notifyListeners();
      return null;
    }
  }

  uploadImages(Asset imagen) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask =
        reference.putData((await imagen.getByteData()).buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    var urlImage = await storageTaskSnapshot.ref.getDownloadURL();
    print(urlImage.toString());

    CollectionReference refCollection = _db.collection('Users');
    refCollection
        .document(_user.id)
        .setData({'Imagen': urlImage.toString()}, merge: true);

    DocumentSnapshot userData = await refCollection.document(_user.id).get();
    _user.setFromFireStore(userData);

    notifyListeners();
  }

  Future<FirebaseUser> firebaseRegister(
      String nombre, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;

      CollectionReference refCollection = _db.collection('Users');

      refCollection.document(user.uid).setData({
        'id': user.uid,
        'Email': user.email,
        'Imagen': '',
        'Nombre': nombre,
        'TipoUsuario': 4
      }, merge: true);

      DocumentSnapshot userData = await refCollection.document(user.uid).get();
      _user.setFromFireStore(userData);
      _status = AuthStatus.Registred;
      notifyListeners();

      return user;
    } catch (e) {
      print(e);
      _status = AuthStatus.Unauthenticated;
      notifyListeners();
      return null;
    }
  }

  void signOut() {
    _auth.signOut();
    _status = AuthStatus.Unauthenticated;
    notifyListeners();
  }

  set status(AuthStatus value) {
    _status = value;
    notifyListeners();
  }

  AuthStatus get status => _status;
  User get user => _user;
}
