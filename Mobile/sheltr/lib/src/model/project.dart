import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Projects with ChangeNotifier {
  List<Project> items = List();
  Projects();

  Projects.fromFirestoreList(List<DocumentSnapshot> docItems) {
    if (docItems == null) return;

    docItems.forEach((element) {
      final project = new Project.fromFirestore(element);
      items.add(project);
    });
  }
}

class Project with ChangeNotifier {
  String id;
  String acercaDeTi;
  int cantPersona;
  String comoEsTuDia;
  bool esRemodelacion;
  String espacio;
  int estado;
  String hobby;
  List<String> imagenes;
  String pais;
  String provincia;
  String localidad;
  String nombre;
  String lugarPreferido;
  String lugarPrincipal;
  int medida;
  String refugio;
  String tipoConstruccion;
  int valor;
  List<String> idBuilders;
  String idManager;
  String idCreator;

  Project({
    this.id,
    this.acercaDeTi,
    this.cantPersona,
    this.comoEsTuDia,
    this.esRemodelacion,
    this.espacio,
    this.estado,
    this.hobby,
    this.imagenes,
    this.pais,
    this.provincia,
    this.localidad,
    this.nombre,
    this.lugarPreferido,
    this.lugarPrincipal,
    this.medida,
    this.refugio,
    this.tipoConstruccion,
    this.valor,
    this.idBuilders,
    this.idManager,
    this.idCreator,
  });

  factory Project.fromFirestore(DocumentSnapshot projectDoc) {
    Map projectData = projectDoc.data;
    return Project(
      id: projectDoc.documentID,
      acercaDeTi: projectData['AcercaDeTi'],
      cantPersona: projectData['CantPersona'],
      comoEsTuDia: projectData['ComoEsTuDia'],
      esRemodelacion: projectData['EsRemodelacion'],
      espacio: projectData['Espacio'],
      estado: projectData['Estado'],
      hobby: projectData['Hobby'],
      imagenes: List.from(projectData['Imagenes']),
      pais: projectData['Pais'],
      provincia: projectData['Provincia'],
      localidad: projectData['Localidad'],
      nombre: projectData['Nombre'],
      lugarPreferido: projectData['LugarPreferido'],
      lugarPrincipal: projectData['LugarPrincipal'],
      medida: projectData['Medida'],
      refugio: projectData['Refugio'],
      tipoConstruccion: projectData['TipoConstruccion'],
      valor: projectData['Valor'],
      idBuilders: List.from(projectData['idBuilders']),
      idManager: projectData['idManager'],
      idCreator: projectData['idManager'],
    );
  }
  void setFromFireStore(DocumentSnapshot projectDoc) {
    Map projectData = projectDoc.data;
    this.id = projectDoc.documentID;
    this.acercaDeTi = projectData['AcercaDeTi'];
    this.cantPersona = projectData['CantPersona'];
    this.comoEsTuDia = projectData['ComoEsTuDia'];
    this.esRemodelacion = projectData['EsRemodelacion'];
    this.espacio = projectData['Espacio'];
    this.estado = projectData['Estado'];
    this.hobby = projectData['Hobby'];
    this.imagenes = List.from(projectData['Imagenes']);
    this.pais = projectData['Pais'];
    this.provincia = projectData['Provincia'];
    this.localidad = projectData['Localidad'];
    this.nombre = projectData['Nombre'];
    this.lugarPreferido = projectData['LugarPreferido'];
    this.lugarPrincipal = projectData['LugarPrincipal'];
    this.medida = projectData['Medida'];
    this.refugio = projectData['Refugio'];
    this.tipoConstruccion = projectData['TipoConstruccion'];
    this.valor = projectData['Valor'];
    this.idBuilders = List.from(projectData['idBuilders']);
    this.idManager = projectData['idManager'];
    this.idCreator = projectData['idManager'];
    notifyListeners();
  }

  @override
  String toString() =>
      '$runtimeType { $id,$acercaDeTi,$cantPersona,$comoEsTuDia,$esRemodelacion,$espacio,$estado,$hobby,$imagenes,$pais,$provincia,$localidad,$nombre, $lugarPreferido,$lugarPrincipal,$medida,$refugio,$tipoConstruccion,$valor,$idBuilders,$idManager,$idCreator }';
}
