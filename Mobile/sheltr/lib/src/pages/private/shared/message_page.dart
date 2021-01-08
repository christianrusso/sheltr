import 'package:flutter/material.dart';
import 'package:sheltr/src/widget/container.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class MenssagePage extends StatefulWidget {
  static final String routeName = 'message';

  @override
  _MenssagePageState createState() => _MenssagePageState();
}

class _MenssagePageState extends State<MenssagePage> {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 35.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView(
                children: <Widget>[
                  Card(
                    elevation: 3.0,
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, MessageDetailPage.routeName),
                      dense: true,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      title: Text('Luisa Perez'),
                      subtitle: Text(
                          'Hola Juan, quería conﬁrmar la reunióna las 14 hs. Avisame, un beso.'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('10:50'),
                          Icon(
                            Icons.brightness_1,
                            size: 8.0,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
                    elevation: 3.0,
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, MessageDetailPage.routeName),
                      dense: true,
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avatar5.png'),
                      ),
                      title: Text('Denis Cander'),
                      subtitle: Text('El electrisista me llamó recién'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('10:48'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
                    elevation: 3.0,
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, MessageDetailPage.routeName),
                      dense: true,
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avatar2.png'),
                      ),
                      title: Text('Pablo Ernesto'),
                      subtitle: Text(
                          'Hola Juan, quería conﬁrmar la reunióna las 14 hs. Avisame, un beso.'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('10:30'),
                          Icon(
                            Icons.brightness_1,
                            size: 8.0,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
                    elevation: 3.0,
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, MessageDetailPage.routeName),
                      dense: true,
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avatar4.png'),
                      ),
                      title: Text('Pablo Ernesto'),
                      subtitle: Text('Ya hable con Ignacio, me dijo que....'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('10:00'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
                    elevation: 3.0,
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, MessageDetailPage.routeName),
                      dense: true,
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avatar6.png'),
                      ),
                      title: Text('Diego Lias'),
                      subtitle: Text('Dale, le aviso.'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('07:10'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Card(
                    elevation: 3.0,
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, MessageDetailPage.routeName),
                      dense: true,
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/avatar7.png'),
                      ),
                      title: Text('María Jule'),
                      subtitle: Text('Perfecto.'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('19:47'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              )),
            ],
          ),
        ));
  }
}

class MessageDetailPage extends StatefulWidget {
  static final String routeName = 'messagedetails';
  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MenuCustom(),
      body: Stack(children: <Widget>[
        ContainerCustom(),
        Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.15,
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 110.0),
                        child: Text(
                          'Juan Perez',
                          style: TextStyle(
                              fontSize: 23.0, color: Colors.grey[600]),
                        ),
                      ),
                      Expanded(
                          child: ListView(children: <Widget>[
                        Card(
                          elevation: 1.0,
                          child: ListTile(
                            dense: true,
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar6.png'),
                            ),
                            title: Text(
                              'Hola, quería conﬁrmar la reunión de hoy a las 14 hs. Avisame, un beso.',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2.0,
                            color: Colors.white60,
                            child: ListTile(
                              dense: true,
                              title: Text(
                                'Hola, quería conﬁrmar la reunión de hoy a las 14 hs. Avisame, un beso.',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              trailing: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Center(
                          child: Text('Ayer a las 5:20 p.m.'),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Card(
                          elevation: 1.0,
                          child: ListTile(
                            dense: true,
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar6.png'),
                            ),
                            title: Text(
                              'Si, no hay problema, ahora en un rato puedo generar otra cita nueva en el calendario, ya te llegara la notificación,Saludos!',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 6.0, top: 40.0, bottom: 5.0),
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
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                icon: IconButton(
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {}),
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(70.0),
                                  ),
                                ),
                                //filled: true,
                                hintStyle: new TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'MyriadPro'),
                                hintText: "",
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.fromLTRB(
                                  0.0,
                                  0.0,
                                  0.0,
                                  0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]))
                    ])))
      ]),
    );
  }
}
