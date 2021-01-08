import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class ConfiguratioPage extends StatefulWidget {
  static final String routeName = 'configuration';

  @override
  _ConfiguratioPageState createState() => _ConfiguratioPageState();
}

class _ConfiguratioPageState extends State<ConfiguratioPage> {
  List<bool> _values = [true, true, true, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MenuCustom(),
        appBar: AppBar(
          title: Container(),
          elevation: 0.0,
        ),
        body: Stack(children: <Widget>[_body()]));
  }

  Widget _body() {
    var size = MediaQuery.of(context).size;
    return Positioned(
      left: 35.0,
      top: 20.0,
      child: Container(
        height: size.height * 0.80,
        width: size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Configuración",
                style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
            SizedBox(
              height: 30,
            ),
            SwitchListTile(
                value: _values[0],
                title: Text('Mostrar Notificaciones'),
                onChanged: (value) {
                  setState(() {
                    _values[0] = value;
                  });
                }),
            SwitchListTile(
                value: _values[1],
                title: Text('Permitir lorem ipsum'),
                onChanged: (value) {
                  setState(() {
                    _values[1] = value;
                  });
                }),
            Divider(
              endIndent: size.width * 0.9,
            ),
            SwitchListTile(
                value: _values[2],
                title: Text('Lorem ipsum'),
                onChanged: (value) {
                  setState(() {
                    _values[2] = value;
                  });
                }),
            SwitchListTile(
                value: _values[3],
                title: Text('Lorem ipsum'),
                onChanged: (value) {
                  setState(() {
                    _values[3] = value;
                  });
                }),
            SwitchListTile(
                value: _values[4],
                title: Text('Lorem ipsum'),
                onChanged: (value) {
                  setState(() {
                    _values[4] = value;
                  });
                }),
            SwitchListTile(
                value: _values[5],
                title: Text('Lorem ipsum'),
                onChanged: (value) {
                  setState(() {
                    _values[5] = value;
                  });
                }),
            Divider(
              endIndent: size.width * 0.9,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Notificaciones de otros tipo'),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              title: Text('Correo electrónico y SMS'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              endIndent: size.width * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}
