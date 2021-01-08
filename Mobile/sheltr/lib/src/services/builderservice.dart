import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuilderService with ChangeNotifier {
  final Firestore _db = Firestore.instance;

  BuilderService() {
    getBuildersAll();
  }

  Stream<QuerySnapshot> getBuildersAll() {
    return _db
        .collection('Users')
        .where('TipoUsuario', isEqualTo: 6)
        .snapshots();
  }

  Stream<QuerySnapshot> getBuildersProjectByID(String idBuilders) {
    return _db
        .collection('ProjectUsers')
        .where('id', isEqualTo: idBuilders)
        .snapshots();
  }

  Future<void> insertBuilders(String idProject, String idBuilder) {
    List<String> data = [idProject];
    final refCollection = _db
        .collection('ProjectUsers')
        .document(idBuilder)
        .setData({'id': idBuilder, 'idProject': FieldValue.arrayUnion(data)},
            merge: true);

    notifyListeners();
    return refCollection;
  }
}
