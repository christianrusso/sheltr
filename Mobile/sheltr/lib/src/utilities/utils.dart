import 'dart:convert';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

enum TipoUsuario { None, Admin, Builder, Manager, Creator }
enum EstadoProyecto {
  Rechazado,
  Creado,
  Aceptado,
  Diseno,
  PlanoMunicipal,
  Ejecucion,
  Licitacion,
  Evolucion,
  Materializacion
}
Future<bool> questionMessage(
    {@required BuildContext context,
    @required String title,
    String subtitle = '',
    String titleCancel = 'Cancelar',
    String titleOk = 'Aceptar'}) async {
  return await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(titleCancel),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          CupertinoDialogAction(
            child: Text(titleOk),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  );
}
Future<bool> questionMessageWithImage(
    {@required BuildContext context,
    @required String title,
    String subtitle = '',
    String titleCancel = 'Cancelar',
    String titleOk = 'Aceptar',String titleImage='Agregar'}) async {
  return await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(titleCancel),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ), 
          CupertinoDialogAction(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              Text(titleImage,style: TextStyle(fontSize: 27)),
              SizedBox(width: 20,),
              Icon(Icons.camera_alt,size: 30)
            ]),
            onPressed: () {
             loadAssets(maxImagenes: 1);
            },
          ),
          CupertinoDialogAction(
            child: Text(titleOk),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      );
    },
  );
}

Future<List<Asset>> loadAssets({int maxImagenes = 10}) async {
  List<Asset> resultList = List<Asset>();

  try {
    resultList = await MultiImagePicker.pickImages(
      maxImages: maxImagenes,
      enableCamera: true,
      selectedAssets: resultList,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      materialOptions: MaterialOptions(
        actionBarColor: "#176CF2",
        actionBarTitle: "Imagenes",
        allViewTitle: "Todas las Fotos",
        useDetailsView: false,
        selectCircleStrokeColor: "#000000",
      ),
    );
    print(resultList.length);
    print((await resultList[0].getThumbByteData(122, 100)));
    print((await resultList[0].getByteData()));
    print((await resultList[0].metadata));
  } on Exception catch (e) {
    print(e.toString());
    return null;
  }

  return resultList;
}

class MultiPickerApp {
  static Color navigateButton = Color(0xff141516);
  static Color pauseButton = Color(0xffF41F00);
  static Color pauseButtonDarker = Color(0xff9B1400);
  static Color background = Color(0xff1E2025);
  static Color brighter = Color(0xff353235);
  static Color darker = Colors.black;
}

class ThreeDContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color backgroundDarkerColor;
  final Color borderColor;
  final Color borderDarkerColor;
  final double spreadRadius;
  final double offset;
  final double blurRadius;
  const ThreeDContainer({
    Key key,
    @required this.child,
    @required this.width,
    @required this.height,
    @required this.backgroundColor,
    @required this.backgroundDarkerColor,
    this.borderColor,
    this.borderDarkerColor,
    this.blurRadius = 15,
    this.spreadRadius = 4,
    this.offset = 4,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(width / 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color: MultiPickerApp.darker,
              offset: Offset(offset, offset),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius),
          BoxShadow(
              color: MultiPickerApp.brighter,
              offset: Offset(-offset, -offset),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius),
        ],
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            borderDarkerColor ?? MultiPickerApp.darker,
            borderColor ?? MultiPickerApp.brighter,
          ],
        ),
      ),
      child: Container(
        width: width,
        height: height,
        child: child,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                backgroundDarkerColor,
                backgroundColor,
              ],
            )),
      ),
    );
  }
}

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  set profile(String value) {
    _prefs.setString('profile', json.encode(value));
  }

  String get profile => json.decode(_prefs.get('profile'));

  // GET y SET de la última página
  int get initPage {
    return _prefs.getInt('initpage');
  }

  set initPage(int value) {
    _prefs.setInt('initpage', value);
  }
}
