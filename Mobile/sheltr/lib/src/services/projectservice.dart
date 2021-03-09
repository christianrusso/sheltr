import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:sheltr/src/model/project.dart';

class ProjectService with ChangeNotifier {
  final Firestore _db = Firestore.instance;
  List<Asset> _images = [];
  List<String> _urlImagens = [];
  Project _project = new Project();
  List<Project> _projects = [];

  ProjectService();

  Stream<QuerySnapshot> getProyectByIdUser(String id) {
    return _db
        .collection('Project')
        .where('idCreator', isEqualTo: id)
        .snapshots();
  }

  getProyectByIdManager(String id) {
    return _db
        .collection('Project')
        .where('idManager', isEqualTo: id)
        .snapshots();
  }

  Future<void> updateStutus(int state) async {
    final String id = _project.id;
    if (id == '' || id == null) return;
    CollectionReference ref = _db.collection("Project");
    var result = await ref.document(id).updateData({'Estado': state});
    notifyListeners();
    return result;
  }

  Future<QuerySnapshot> getProjectsByIdBuilders(String id) async {
    List<String> projects = [];
    CollectionReference builderRef = _db.collection('ProjectUsers');

    var doc = await builderRef.document(id).get();
    Map project = doc.data;
    projects = List.from(project['idProject']);

    var retvalues = await _db
        .collection('Project')
        .where('id', whereIn: projects)
        .getDocuments();

    notifyListeners();

    return retvalues;
  }

  Future<void> addOrProject() async {
    if (_project.idCreator != '' || _project.idCreator == null) {
      for (var image in _images) {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        StorageReference reference =
            FirebaseStorage.instance.ref().child(fileName);
        StorageUploadTask uploadTask =
            reference.putData((await image.getByteData()).buffer.asUint8List());
        StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
        var urlImage = await storageTaskSnapshot.ref.getDownloadURL();
        print(urlImage.toString());
        _urlImagens.add(urlImage.toString());
      }

      DocumentReference ref = _db.collection("Project").document();
      return await ref.setData({
        'id': ref.documentID,
        'AcercaDeTi': _project.acercaDeTi,
        'CantPersona': _project.cantPersona,
        'ComoEsTuDia': _project.comoEsTuDia,
        'EsRemodelacion': _project.esRemodelacion,
        'Espacio': _project.espacio,
        'Estado': 1,
        'Hobby': _project.hobby,
        'Imagenes': _urlImagens.toList(),
        'Pais': _project.pais,
        'Provincia': _project.provincia,
        'Localidad': _project.localidad,
        'Nombre': _project.nombre,
        'LugarPreferido': _project.lugarPreferido,
        'LugarPrincipal': _project.lugarPrincipal,
        'Medida': _project.medida,
        'Refugio': _project.refugio,
        'TipoConstruccion': _project.tipoConstruccion,
        'Valor': _project.valor,
        'idBuilders': [''],
        'idManager': _project.idManager,
        'idCreator': _project.idCreator,
      }, merge: true);
    }
    _urlImagens = null;
    _images = null;
    notifyListeners();
  }

  uploadImages() async {
    for (var image in _images) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      StorageReference reference =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask =
          reference.putData((await image.getByteData()).buffer.asUint8List());
      StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
      var urlImage = await storageTaskSnapshot.ref.getDownloadURL();
      print(urlImage.toString());
      _urlImagens.add(urlImage.toString());
    }
  }

  set project(Project value) {
    _project = value;
    notifyListeners();
  }

  Project get project => _project;

  set projects(List<Project> values) {
    _projects = values;
    notifyListeners();
  }

  List<Project> get projects => _projects;

  set images(List<Asset> values) {
    _images = values;
    notifyListeners();
  }

  List<Asset> get images => _images;
}
