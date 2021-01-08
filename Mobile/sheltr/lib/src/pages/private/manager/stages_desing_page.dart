import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/private/manager/stage_calendar.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/container.dart';
import 'package:sheltr/src/widget/imageHorizontal.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class StageDesingManagerPage extends StatefulWidget {
  static final String routeName = 'stagedesingmanager';

  @override
  _StageDesingManagerPageState createState() => _StageDesingManagerPageState();
}

class _StageDesingManagerPageState extends State<StageDesingManagerPage> {
  bool _onClick = false;

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectService>(context);

    return Scaffold(
      endDrawer: MenuCustom(),
      appBar: AppBar(
        title: Container(),
        elevation: 0.0,
      ),
      body: Stack(children: <Widget>[
        ContainerCustom(),
        _body(context),
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.18),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: ImagenHorizontal(
              imagenes: projectProvider.project.imagenes,
              onPress: () => print('on press de la imagen')),
        ),
      ]),
    );
  }

  Widget _body(BuildContext context) {
    final userProvider = Provider.of<AuthService>(context);
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.045,
      top: MediaQuery.of(context).size.height * 0.05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.85,
            child: ListTile(
              dense: true,
              title: Text(
                'Diseño',
                style: TextStyle(color: Colors.grey[600], fontSize: 23.0),
              ),
              subtitle: Text(
                'Etapa 4',
                style: TextStyle(color: Colors.blueAccent, fontSize: 17.0),
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    _onClick = !_onClick;
                  });
                  Navigator.pushNamed(
                      context, StageCalendarManagerPage.routeName);
                },
                child: Icon(
                  Icons.plus_one,
                  size: 30.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.57,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Comentarios',
                  style: TextStyle(color: Colors.grey[600], fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 50.0,
                    child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            NetworkImage(userProvider.user.imagen)),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                        'Arquitecto Raúl Gómez  En la imagen 3 se puede ver el arreglo que pidió, a mi parecer podríamos volver a la idea anterior.',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 15.0)),
                  )
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: 35.0,
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(70.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3.0,
                          offset: Offset(0.0, 5.0),
                          spreadRadius: 3.0)
                    ]),
                child: TextField(
                  textAlign: TextAlign.left,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(70.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(
                        color: Colors.blueAccent, fontFamily: 'MyriadPro'),
                    hintText: "Agregar un comentario....",
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
            ],
          )
        ],
      ),
    );
  }
}
