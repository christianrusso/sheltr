import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sheltr/src/model/user.dart';

class ManagerService with ChangeNotifier {
  final Firestore _db = Firestore.instance;
  List<User> _users = [];
  User _currentUser = new User();

  ManagerService() {
    this.getManagerAll();
  }

  getManagerAll() async {
    _db
        .collection('Users')
        .where('TipoUsuario', isEqualTo: 5)
        .snapshots()
        .listen((event) {
      event.documents.forEach((element) {
        var user = User.fromFirestore(element);
        _users.add(user);
        notifyListeners();
      });
    });
  }

  getManagerById(String id) {}

  List<User> get managers => _users;

  set currentManager(User value) {
    _currentUser = value;
    notifyListeners();
  }

  User get currentManager => _currentUser;
}
