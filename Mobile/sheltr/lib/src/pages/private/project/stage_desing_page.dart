import 'package:flutter/material.dart';
import 'package:sheltr/src/pages/private/project/stage_calendar_page.dart';
import 'package:sheltr/src/widget/container.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class StageDesingPage extends StatefulWidget {
  static final String routeName = 'stagedesingpage';

  @override
  _StageDesingPageState createState() => _StageDesingPageState();
}

class _StageDesingPageState extends State<StageDesingPage> {
  bool _onClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MenuCustom(),
      appBar: AppBar(
        title: Container(),
      ),
      body: Stack(children: <Widget>[
        ContainerCustom(),
        _body(context),
        _onClick ? _modal() : Container()
      ]),
    );
  }

  Widget _body(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.045,
      top: 40.0,
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
                'Etapa 3',
                style: TextStyle(color: Colors.blueAccent, fontSize: 17.0),
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    _onClick = !_onClick;
                  });
                },
                child: Icon(
                  _onClick ? Icons.favorite : Icons.favorite_border,
                  size: 30.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.87,
            child: Image(image: AssetImage('assets/images/maqueta.png')),
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
                            AssetImage('assets/images/avatar2.png')),
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

  Widget _modal() {
    return Positioned(
        left: MediaQuery.of(context).size.width * 0.18,
        top: 90.0,
        child: GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, StageCalendarPage.routeName),
          child: Container(
            height: 100.0,
            width: 270.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.blueAccent, width: 2.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text('¡Apruebo la etapa!',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                        child: Text(
                      'Al aprobar etapa, el PM podrá continuar a la próxima.',
                      style:
                          TextStyle(color: Colors.blueAccent, fontSize: 17.0),
                    )))
              ],
            ),
          ),
        ));
  }
}
