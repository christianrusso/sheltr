import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/model/project.dart';
import 'package:sheltr/src/pages/private/project/add_page.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/container.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class InitProjectPage extends StatelessWidget {
  static final String routeName = 'initproject';
  final TextEditingController _nombreCotroller = new TextEditingController();
  final TextEditingController _refugioCotroller = new TextEditingController();
  final TextEditingController _cantPersonaCotroller =
      new TextEditingController();
  final TextEditingController _hobbyCotroller = new TextEditingController();
  final TextEditingController _lugarPrincipalCotroller =
      new TextEditingController();
  final TextEditingController _lugarPreferidoCotroller =
      new TextEditingController();
  final TextEditingController _acercaDeTiCotroller =
      new TextEditingController();
  final TextEditingController _comoEsTuDiaCotroller =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final proyectProvider = Provider.of<ProjectService>(context);
    final userProvider = Provider.of<AuthService>(context).user;
    return Scaffold(
      endDrawer: MenuCustom(),
      appBar: AppBar(
        title: Container(),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          ContainerCustom(),
          Container(
            padding: EdgeInsets.only(top: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(25.0),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Queremos saber un poco más de vos...',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black38)),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text('Nombre de tu proyecto',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black38)),
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
                                controller: _nombreCotroller,
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
                                      color: Colors.blue[400],
                                      fontFamily: 'MyriadPro'),
                                  hintText: "Escribe tu respuesta",
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
                          Text('¿Cómo te imaginas tu refugio?',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black38)),
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
                                controller: _refugioCotroller,
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
                                      color: Colors.blue[400],
                                      fontFamily: 'MyriadPro'),
                                  hintText: "Escribe tu respuesta",
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
                          Text(
                              '¿Cuántas personas viven con vos o planean vivir?',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black38)),
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
                                controller: _cantPersonaCotroller,
                                keyboardType: TextInputType.number,
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
                                      color: Colors.blue[400],
                                      fontFamily: 'MyriadPro'),
                                  hintText: "Escribe tu respuesta",
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
                          Text('¿Hobby?',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black38)),
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
                                controller: _hobbyCotroller,
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
                                      color: Colors.blue[400],
                                      fontFamily: 'MyriadPro'),
                                  hintText: "Escribe tu respuesta",
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
                          Text('Si tenes visitas, ¿dónde te gusta recibirlas?',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black38)),
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
                                controller: _lugarPrincipalCotroller,
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
                                      color: Colors.blue[400],
                                      fontFamily: 'MyriadPro'),
                                  hintText: "Escribe tu respuesta",
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
                          Text('¿Cuál es TU lugar de la casa?',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black38)),
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
                                controller: _lugarPreferidoCotroller,
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
                                      color: Colors.blue[400],
                                      fontFamily: 'MyriadPro'),
                                  hintText: "Escribe tu respuesta",
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
                          Text('Acerca de vos...',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black38)),
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
                                controller: _acercaDeTiCotroller,
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
                                      color: Colors.blue[400],
                                      fontFamily: 'MyriadPro'),
                                  hintText: "Escribe tu respuesta",
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
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('¿Cómo es tu día a día?',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black38)),
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
                                controller: _comoEsTuDiaCotroller,
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
                                      color: Colors.blue[400],
                                      fontFamily: 'MyriadPro'),
                                  hintText: "Escribe tu respuesta",
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
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 80.0, top: 30.0),
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF176CF2),
                                          Color(0xFF176CF2)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 150.0, minHeight: 45.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Aceptar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'MyriadPro',
                                          fontSize: 19.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  //TODO VALidador

                                  final _proyect = new Project();

                                  _proyect.nombre =
                                      _nombreCotroller.text[0].toUpperCase() +
                                          _nombreCotroller.text.substring(1);
                                  _proyect.refugio = _refugioCotroller.text;
                                  _proyect.cantPersona =
                                      int.parse(_cantPersonaCotroller.text);
                                  _proyect.hobby = _hobbyCotroller.text;
                                  _proyect.lugarPrincipal =
                                      _lugarPrincipalCotroller.text;
                                  _proyect.lugarPreferido =
                                      _lugarPreferidoCotroller.text;
                                  _proyect.acercaDeTi =
                                      _acercaDeTiCotroller.text;
                                  _proyect.comoEsTuDia =
                                      _comoEsTuDiaCotroller.text;
                                  _proyect.idCreator = userProvider.id;

                                  proyectProvider.project = _proyect;

                                  Navigator.popAndPushNamed(
                                      context, AddProjectPage.routeName);
                                }),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
