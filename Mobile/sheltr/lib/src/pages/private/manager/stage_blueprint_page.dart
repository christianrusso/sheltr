import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/private/manager/stage_execute_page.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/utilities/utils.dart' as Utils;

class StageBlueprintManagerPage extends StatefulWidget {
  static final String routeName = 'stagesblueprint';

  @override
  _StageBlueprintManagerPage createState() => _StageBlueprintManagerPage();
}

class _StageBlueprintManagerPage extends State<StageBlueprintManagerPage> {
  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectService>(context, listen: false);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.90, top: 35.0),
            child: Container(
              height: 30.0,
              width: 30.0,
              child: Image(image: AssetImage('assets/images/icon_close.png')),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 45.0,
              ),
              Text(
                'Plano Municipal',
                style: TextStyle(color: Colors.blueAccent, fontSize: 30.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Etapa 4',
                  style: TextStyle(color: Colors.grey[600], fontSize: 20.0)),
              Container(
                height: 300.0,
                width: 300.0,
                child: Image(image: AssetImage('assets/images/book.png')),
              ),
              Text(
                '¡Haz pasado a la Etapa 4!',
                style: TextStyle(color: Colors.grey[600], fontSize: 17.0),
              ),
              Container(
                width: 250.0,
                child: Text(
                    'El cliente esperara que lo tengas al tanto de los planos municipales.',
                    style: TextStyle(color: Colors.grey[600], fontSize: 17.0)),
              ),
              SizedBox(
                height: 55.0,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF176CF2), Color(0xFF176CF2)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 150.0, minHeight: 45.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Entendido",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MyriadPro',
                            fontSize: 19.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    final question = await Utils.questionMessageWithImage(
                        context: context,
                        title: '¿Desea pasar a la siguiente etapa?');
                    if (question) {
                      projectProvider.updateStutus(4);
                      Navigator.popAndPushNamed(
                          context, StageExecuteManagerPage.routeName);
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }
}
