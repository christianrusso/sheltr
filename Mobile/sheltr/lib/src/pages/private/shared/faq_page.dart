import 'package:flutter/material.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class FaqPage extends StatelessWidget {
  static final String routeName = 'faq';

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
        height: size.height * 0.80,
        width: size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Preguntas Frecuentes",
                style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('¿Lorem ipsum dolor sit amet? '),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Lorem ipsum dolor sit amet, consectetuer'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('¿Lorem ipsum dolor sit amet? '),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Lorem ipsum dolor sit amet, consectetuer'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('¿Lorem ipsum dolor sit amet?'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Lorem ipsum dolor sit amet, consectetuer'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('¿Lorem ipsum dolor sit amet?'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Lorem ipsum dolor sit amet, consectetuer'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
