import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/services/managerservice.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/radioButton.dart';
import 'package:sheltr/src/widget/raiseButton.dart';
import 'package:sheltr/src/utilities/utils.dart' as Utils;

class OneStep extends StatelessWidget {
  final VoidCallback onChangeStep;
  final TextEditingController _pais = new TextEditingController();
  final TextEditingController _provincia = new TextEditingController();
  final TextEditingController _localidad = new TextEditingController();

  OneStep(this.onChangeStep);

  @override
  Widget build(BuildContext context) {
    final proyectProvider = Provider.of<ProjectService>(context);

    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Ubicación',
                  style: TextStyle(fontSize: 20.0, color: Colors.black38)),
              SizedBox(
                height: 15.0,
              ),
              Text('Pais',
                  style: TextStyle(fontSize: 15.0, color: Colors.black38)),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0.0, 3.0),
                            spreadRadius: 3.0)
                      ]),
                  child: TextField(
                    controller: _pais,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          onPressed: () {}),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(70.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                          color: Colors.black54, fontFamily: 'MyriadPro'),
                      hintText: "Argentina",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(
                        30.0,
                        3.0,
                        3.0,
                        3.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text('Provincia',
                  style: TextStyle(fontSize: 15.0, color: Colors.black38)),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0.0, 3.0),
                            spreadRadius: 3.0)
                      ]),
                  child: TextField(
                    controller: _provincia,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          onPressed: () {}),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(70.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                          color: Colors.black54, fontFamily: 'MyriadPro'),
                      hintText: "Provincia",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(
                        30.0,
                        3.0,
                        3.0,
                        3.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Localidad',
                  style: TextStyle(fontSize: 15.0, color: Colors.black38)),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0.0, 3.0),
                            spreadRadius: 3.0)
                      ]),
                  child: TextField(
                    controller: _localidad,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          onPressed: () {}),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(70.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                          color: Colors.black54, fontFamily: 'MyriadPro'),
                      hintText: "Localidad",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(
                        30.0,
                        3.0,
                        3.0,
                        3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF176CF2), Color(0xFF176CF2)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 150.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Siguiente",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MyriadPro',
                          fontSize: 19.0),
                    ),
                  ),
                ),
                onPressed: () {
                  final project = proyectProvider.project;
                  project.pais = _pais.text;
                  project.provincia = _provincia.text;
                  project.localidad = _localidad.text;
                  proyectProvider.project = project;
                  onChangeStep();
                }),
          ],
        ),
      ],
    );
  }
}

class TwoStep extends StatelessWidget {
  final VoidCallback onChangeStep;
  final List<RadioModel> _radios = [
    RadioModel(
        id: '1', isSelected: false, buttonText: 'Construcción dede cero'),
    RadioModel(id: '1', isSelected: false, buttonText: 'Remodelacion')
  ];

  TwoStep(this.onChangeStep);
  @override
  Widget build(BuildContext context) {
    final proyectProvider = Provider.of<ProjectService>(context);

    return ListView(children: [
      Container(
        padding: EdgeInsets.only(left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('¿Qué tipo de proyecto haremos?',
                style: TextStyle(fontSize: 20.0, color: Colors.black38)),
            SizedBox(
              height: 40.0,
            ),
            Container(
                height: 200.0, child: RadioButtonCustom(itmesRadios: _radios)),
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF176CF2), Color(0xFF176CF2)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 150.0, minHeight: 45.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Siguiente",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MyriadPro',
                        fontSize: 19.0),
                  ),
                ),
              ),
              onPressed: () {
                final _project = proyectProvider.project;
                _project.esRemodelacion = _radios[0].isSelected;
                proyectProvider.project = _project;
                onChangeStep();
              }),
        ],
      ),
    ]);
  }
}

class ThreeStep extends StatelessWidget {
  final VoidCallback onChangeStep;
  final TextEditingController _tipoConstruccionController =
      new TextEditingController();
  final TextEditingController _espacioController = new TextEditingController();
  final TextEditingController _medidaController = new TextEditingController();

  ThreeStep(this.onChangeStep);

  @override
  Widget build(BuildContext context) {
    final proyectProvider = Provider.of<ProjectService>(context);
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('¿Que tipo de reforma hacemos?',
                  style: TextStyle(fontSize: 20.0, color: Colors.black38)),
              SizedBox(
                height: 15.0,
              ),
              Text('Tipo Edificio',
                  style: TextStyle(fontSize: 15.0, color: Colors.black38)),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0.0, 3.0),
                            spreadRadius: 3.0)
                      ]),
                  child: TextField(
                    controller: _tipoConstruccionController,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          onPressed: () {}),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(70.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                          color: Colors.black54, fontFamily: 'MyriadPro'),
                      hintText: "Casa",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(
                        30.0,
                        3.0,
                        3.0,
                        3.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text('Espacio',
                  style: TextStyle(fontSize: 15.0, color: Colors.black38)),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0.0, 3.0),
                            spreadRadius: 3.0)
                      ]),
                  child: TextField(
                    controller: _espacioController,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          onPressed: () {}),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(70.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                          color: Colors.black54, fontFamily: 'MyriadPro'),
                      hintText: "Jardin",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(
                        30.0,
                        3.0,
                        3.0,
                        3.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Medida',
                  style: TextStyle(fontSize: 15.0, color: Colors.black38)),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0.0, 3.0),
                            spreadRadius: 3.0)
                      ]),
                  child: TextField(
                    controller: _medidaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          onPressed: () {}),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(70.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                          color: Colors.black54, fontFamily: 'MyriadPro'),
                      hintText: "Tantos metros cuadrados",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(
                        30.0,
                        3.0,
                        3.0,
                        3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF176CF2), Color(0xFF176CF2)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 150.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Siguiente",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MyriadPro',
                          fontSize: 19.0),
                    ),
                  ),
                ),
                onPressed: () {
                  final _project = proyectProvider.project;

                  _project.tipoConstruccion = _tipoConstruccionController.text;
                  _project.espacio = _espacioController.text;
                  _project.medida = int.parse(_medidaController.text);

                  proyectProvider.project = _project;

                  onChangeStep();
                }),
          ],
        ),
      ],
    );
  }
}

class FourStep extends StatefulWidget {
  final VoidCallback onChangeStep;
  FourStep(this.onChangeStep);

  @override
  _FourStepState createState() => _FourStepState();
}

class _FourStepState extends State<FourStep> {
  List<Asset> _images = List<Asset>();

  bool isUploading = false;

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectService>(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Referentes',
                  style: TextStyle(fontSize: 20.0, color: Colors.black38)),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    '¡Volcá imágenes que tengas en mente para tu lugar soñado!',
                    style: TextStyle(fontSize: 17.0, color: Colors.black38)),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaiseButtonCustom(onClick: () async {
              try {
                var _imagen = await Utils.loadAssets(maxImagenes: 10);
                if (_imagen != null) {
                  setState(() {
                    _images = _imagen;
                  });
                }
              } catch (e) {
                _images = null;
              }
            }),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _images.length > 0 && _images != null
                ? RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF176CF2), Color(0xFF176CF2)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 150.0, minHeight: 45.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Siguiente",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MyriadPro',
                              fontSize: 19.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      projectProvider.images = null;
                      projectProvider.images = _images;
                      widget.onChangeStep();
                    })
                : Container(),
          ],
        )
      ],
    );
  }
}

class FiveStep extends StatelessWidget {
  final VoidCallback onChangeStep;
  final TextEditingController _valor = new TextEditingController();
  FiveStep(this.onChangeStep);

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectService>(context);
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Hablemos de dinero',
                  style: TextStyle(fontSize: 20.0, color: Colors.black38)),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                    'Ingresa un rango aproximado de lo que estas dispuesto a gastar.',
                    style: TextStyle(fontSize: 17.0, color: Colors.black38)),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('Efectivo a gastar',
                    style: TextStyle(fontSize: 15.0, color: Colors.black38)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  margin: EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0.0, 3.0),
                            spreadRadius: 3.0)
                      ]),
                  child: TextField(
                    controller: _valor,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          onPressed: () {}),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(70.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(
                          color: Colors.black54, fontFamily: 'MyriadPro'),
                      hintText: "Aproximado",
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.fromLTRB(
                        30.0,
                        3.0,
                        3.0,
                        3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF176CF2), Color(0xFF176CF2)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 150.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Siguiente",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MyriadPro',
                          fontSize: 19.0),
                    ),
                  ),
                ),
                onPressed: () {
                  final _project = projectProvider.project;
                  _project.valor = int.parse(_valor.text);
                  projectProvider.project = _project;
                  onChangeStep();
                }),
          ],
        ),
      ],
    );
  }
}

class SixStep extends StatefulWidget {
  final VoidCallback onChangeStep;

  SixStep(this.onChangeStep);

  @override
  _SixStepState createState() => _SixStepState();
}

class _SixStepState extends State<SixStep> {
  final List<RadioModel> _radios = new List();

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectService>(context);

    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('¡Utimo Paso!',
                  style: TextStyle(fontSize: 20.0, color: Colors.black38)),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Elige tu Project Manager ',
                    style: TextStyle(fontSize: 19.0, color: Colors.black38)),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
            padding: EdgeInsets.only(left: 30.0),
            height: 200.0,
            child:
                Consumer(builder: (context, ManagerService managerService, _) {
              if (managerService.managers != null) {
                _radios.clear();
                managerService.managers.forEach((element) {
                  _radios.add(new RadioModel(
                      id: element.id,
                      isSelected: false,
                      pathImagen: element.imagen,
                      textName: element.nombre));
                });

                return RadioButtonCustom(
                  itmesRadios: _radios,
                  isRich: true,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF176CF2), Color(0xFF176CF2)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 150.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Siguiente",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MyriadPro',
                          fontSize: 19.0),
                    ),
                  ),
                ),
                onPressed: () {
                  final idmanager = _radios
                      .where((element) => element.isSelected == true)
                      .first
                      .id;
                  final _project = projectProvider.project;
                  _project.idManager = idmanager;
                  projectProvider.project = _project;
                  widget.onChangeStep();
                }),
          ],
        )
      ],
    );
  }
}

class SevenStep extends StatelessWidget {
  final VoidCallback onChangeStep;

  SevenStep(this.onChangeStep);

  @override
  Widget build(BuildContext context) {
    final providerProject = Provider.of<ProjectService>(context);
    return FutureBuilder(
      future: providerProject.addOrProject(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (ConnectionState.done == snapshot.connectionState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('¡Ya está todo listo!',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.black38)),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Tu proyecto ya está listo para empezar.',
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.black38)),
                    ),
                    SizedBox(
                      height: 95.0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image(
                            image: AssetImage('assets/images/icon_check.png')))
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF176CF2), Color(0xFF176CF2)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 150.0, minHeight: 45.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Ir a Proyecto",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'MyriadPro',
                                  fontSize: 19.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          onChangeStep();
                        }),
                  ],
                ),
              ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Cargando tus datos...',
                      style: TextStyle(fontSize: 20.0, color: Colors.black38)),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                          'Estamos eligiendo a la persona indicada para realizar tu sueño.',
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.black38)),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.27,
                  ),
                  SpinKitHourGlass(
                    size: 100.0,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
