import 'package:flutter/material.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class WalletPage extends StatelessWidget {
  static final String routeName = 'wallet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MenuCustom(),
        appBar: AppBar(
          title: Container(),
          elevation: 0.0,
        ),
        body: Stack(children: <Widget>[_body(context)]));
  }

  Widget _body(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
        left: 35.0,
        top: 20.0,
        child: Container(
            height: size.height * 0.8,
            width: size.width * 0.9,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.25),
                    child: Container(
                      width: 110,
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 3.0,
                                offset: Offset(0.0, 3.0),
                                spreadRadius: 3.0)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Ganancias'),
                            Text("\$\ 9.000")
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.width * 0.87,
                    height: size.height * 0.65,
                    child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(
                              'E1- Proyecto Sur',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            subtitle: Text('Hace una semana'),
                            trailing: Text(
                              '\$\7.958',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(
                              'E5- Proyecto Roma',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            subtitle: Text('Hace una semana'),
                            trailing: Text(
                              '\$\2.070',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(
                              'E3- Proyecto Roma',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            subtitle: Text('Hace una semana'),
                            trailing: Text(
                              '\$\4.080',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(
                              'E2- Proyecto Roma',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            subtitle: Text('Hace 3 semanas'),
                            trailing: Text(
                              '\$\5.000',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Text(
                              'E1- Proyecto Roma',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            subtitle: Text('Hace un mes'),
                            trailing: Text(
                              '\$\1.000',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ])));
  }
}
