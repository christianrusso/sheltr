import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sheltr/src/utilities/utils.dart' as Utils;

class Users with ChangeNotifier {
  List<User> items = [];
  Users();

  Users.fromFirestoreList(List<DocumentSnapshot> docItems) {
    if (docItems == null) return;

    docItems.forEach((element) {
      final project = new User.fromFirestore(element);
      items.add(project);
    });
  }
}

class User with ChangeNotifier {
  String id;
  String imagen;
  String nombre;
  String email;
  int tipoUsuario;

  final _pref = Utils.PreferenciasUsuario();

  User({this.id, this.imagen, this.nombre, this.email, this.tipoUsuario});

  factory User.fromFirestore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data;
    return User(
        id: userDoc.documentID,
        nombre: userData['Nombre'],
        imagen: userData['Imagen'],
        email: userData['Email'],
        tipoUsuario: userData['TipoUsuario']);
  }
  User copyWith({
    String id,
    String imagen,
    String nombre,
    String email,
    int tipoUsuario
  }) =>
      User(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        imagen: imagen ?? this.imagen,
        tipoUsuario: tipoUsuario ?? this.tipoUsuario,
      );


  static User fromJson(Map<String, dynamic> json) => User(
        id :json["id"],
        nombre : json["Nombre"],
        imagen : json["Imagen"],
        email : json["Email"],
        tipoUsuario : json["TipoUsuario"]
  );


  Map<String, dynamic> toJson() => {
        "id": id,
        "Nombre": nombre,
        "Email": email,
        "Imagen": imagen,
        "TipoUsuario": tipoUsuario,
      };

  void setFromFireStore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data;
    this.id = userDoc.documentID;
    this.nombre = userData['Nombre'];
    this.imagen = userData['Imagen'];
    this.email = userData['Email'];
    this.tipoUsuario = userData['TipoUsuario'];

     final user = User(id:userDoc.documentID,nombre: userDoc['Nombre'],imagen: userDoc['Imagen'],email:userDoc['Email'],tipoUsuario: userDoc['TipoUsuario']);
         
    _pref.profile=user;
    
    notifyListeners();
  }
}
