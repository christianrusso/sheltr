import 'package:flutter/material.dart';
import 'package:sheltr/src/widget/container.dart';

class PerfilPage extends StatefulWidget {
  static final String routeName = 'perfil';
  PerfilPage({Key key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          ContainerCustom(),
          _header(),
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            width: 300,
            child: GridView.count(
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 30.0,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.27),
                crossAxisCount: 2,
                children: _items()),
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Positioned(
      left: 35.0,
      top: 35.0,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  child: Image(
                    image: AssetImage('assets/images/avatar2.png'),
                  ),
                ),
                SizedBox(
                  width: 40.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Porfolio",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Raul Gomez",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text("3/5")
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text("Palermo, Buenos Aires")
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              'Mis Proyectos',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _items() {
    final content = List<Widget>();

    content.add(GestureDetector(
      onTap: () {},
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/p1.png'), fit: BoxFit.cover),
        ),
      ),
    ));

    content.add(new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/p2.png'), fit: BoxFit.cover),
      ),
    ));
    content.add(GestureDetector(
      onTap: () {},
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/p3.png'), fit: BoxFit.cover),
        ),
      ),
    ));

    content.add(new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/p4.png'), fit: BoxFit.cover),
      ),
    ));
    content.add(GestureDetector(
      onTap: () {},
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/p3.png'), fit: BoxFit.cover),
        ),
      ),
    ));

    content.add(new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/p4.png'), fit: BoxFit.cover),
      ),
    ));

    return content;
  }
}
