import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/private/manager/stage_execute_page.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/container.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

class StagesStepManagerPages extends StatefulWidget {
  static final String routeName = 'stagesstepmanager';

  @override
  _StagesStepManagerPagesState createState() => _StagesStepManagerPagesState();
}

class _StagesStepManagerPagesState extends State<StagesStepManagerPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MenuCustom(),
        appBar: AppBar(
          title: Container(),
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[ContainerCustom(), _head(context)],
        ));
  }

  Widget _head(BuildContext context) {
    return Positioned(
        left: MediaQuery.of(context).size.width * 0.10,
        top: MediaQuery.of(context).size.height * 0.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Etapas',
              style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
            ),
            SizedBox(height: 30.0),
            _stepper()
          ],
        ));
  }

  Widget _stepper() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 450.0,
            width: 90.0,
            child: Image(image: AssetImage('assets/images/stepper3.png')),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 19.0,
              ),
              Text(
                'Crear Sueño',
                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 38.0,
              ),
              Text(
                'Croquis/Esquemas',
                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Diseño',
                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 34.0,
              ),
              GestureDetector(
                onTap: () => _handleClickMe(),
                child: Text(
                  'Plano Municipal',
                  style: TextStyle(fontSize: 15.0, color: Colors.blueAccent),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Text(
                'Proyecto en Ejecución',
                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 35.0,
              ),
              Text(
                'Licitaciones',
                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 36.0,
              ),
              Text(
                'Evolución de Rubros',
                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 36.0,
              ),
              Text(
                'Materialiazación de Proyecto',
                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _handleClickMe() async {
    final projectProvider = Provider.of<ProjectService>(context, listen: false);
    return await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('¿Desea pasar a la siguiente etapa?'),
          content: Text(''),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('Aceptar'),
              onPressed: () {
                projectProvider.updateStutus(5);
                Navigator.popAndPushNamed(
                    context, StageExecuteManagerPage.routeName);
              },
            ),
          ],
        );
      },
    );
  }
}
