import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class MapaPage extends StatefulWidget {
  static final String routeName = 'mapa';

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

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
    return Container(
      height: 600,
      width: 600,
      child: MapboxMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            const CameraPosition(target: LatLng(-34.609017, -58.372560)),
      ),
    );
  }
}
