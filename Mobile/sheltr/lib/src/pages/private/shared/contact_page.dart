import 'package:flutter/material.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class ContactPage extends StatelessWidget {
  static final String routeName = 'contact';

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
      left: 23.0,
      top: 20.0,
      child: Container(
        height: size.height * 0.80,
        width: size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Contactanos...",
                style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Av. Alicia Moreau de Justo 740, Puerto Madero',
                  style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '(+54) 11 4343-0158',
                  style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'contacto@sheltr.com.ar',
                  style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
                )
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text('Nombre y Apellido',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MyriadPro',
                      fontSize: 13.0)),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              style: TextStyle(
                  color: Colors.black, fontFamily: 'MyriadPro', fontSize: 13.0),
              textAlign: TextAlign.left,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(
                    color: Colors.grey[600], fontFamily: 'MyriadPro'),
                hintText: "Nombre y Apellido",
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.fromLTRB(
                  30.0,
                  1.0,
                  1.0,
                  1.0,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text('Correo electrónico',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MyriadPro',
                      fontSize: 13.0)),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              style: TextStyle(
                  color: Colors.black, fontFamily: 'MyriadPro', fontSize: 13.0),
              textAlign: TextAlign.left,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(
                    color: Colors.grey[600], fontFamily: 'MyriadPro'),
                hintText: "nombre@ejemplo.com",
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.fromLTRB(
                  30.0,
                  1.0,
                  1.0,
                  1.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text('Teléfono',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MyriadPro',
                      fontSize: 13.0)),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              style: TextStyle(
                  color: Colors.black, fontFamily: 'MyriadPro', fontSize: 13.0),
              textAlign: TextAlign.left,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.fromLTRB(
                  30.0,
                  1.0,
                  1.0,
                  1.0,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text('Mensaje',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MyriadPro',
                      fontSize: 13.0)),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              style: TextStyle(
                  color: Colors.black, fontFamily: 'MyriadPro', fontSize: 13.0),
              textAlign: TextAlign.left,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(50.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.fromLTRB(
                  30.0,
                  2.0,
                  2.0,
                  2.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.30),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.blue[200]],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 100.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Enviar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MyriadPro',
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
