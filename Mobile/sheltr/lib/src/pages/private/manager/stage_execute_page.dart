import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/model/user.dart';
import 'package:sheltr/src/pages/private/manager/stages_desing_page.dart';
import 'package:sheltr/src/services/builderservice.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/container.dart';
import 'package:sheltr/src/widget/dropDownList.dart';
import 'package:sheltr/src/widget/sideMenu.dart';
import 'package:sheltr/src/utilities/utils.dart' as Utils;

class StageExecuteManagerPage extends StatefulWidget {
  static final String routeName = 'stagesexecutemanager';

  @override
  _StageExecuteManagerPageState createState() =>
      _StageExecuteManagerPageState();
}

class _StageExecuteManagerPageState extends State<StageExecuteManagerPage> {
  @override
  Widget build(BuildContext context) {
    final builderProviders = Provider.of<BuilderService>(context);
    final projectProvider = Provider.of<ProjectService>(context);
    return Scaffold(
      endDrawer: MenuCustom(),
      appBar: AppBar(
        title: Container(),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          ContainerCustom(),
          _head(context),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.17,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder(
                  stream: builderProviders.getBuildersAll(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final builders =
                        Users.fromFirestoreList(snapshot.data.documents);

                    if (builders.items.length == 0) {
                      return Center(
                        child: Text('No tiene proyectos asignados'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0.0),
                      scrollDirection: Axis.vertical,
                      primary: true,
                      itemCount: builders.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AwesomeListItem(
                            title: builders.items[index].nombre,
                            content: builders.items[index].email,
                            color: Color(0xF246AF5),
                            onPressed: () async {
                              final question = await Utils.questionMessageWithImage(
                                  context: context,
                                  title: 'Agregar el contructor ?');
                              if (question) {
                                builderProviders.insertBuilders(
                                    projectProvider.project.id,
                                    builders.items[index].id);
                                projectProvider.updateStutus(5);
                                Navigator.popAndPushNamed(
                                    context, StageDesingManagerPage.routeName);
                              }
                            },
                            image: builders.items[index].imagen);
                      },
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget _head(BuildContext context) {
    return Positioned(
        left: MediaQuery.of(context).size.width * 0.10,
        top: MediaQuery.of(context).size.height * 0.07,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Contructores',
              style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
            ),
            SizedBox(height: 30.0)
          ],
        ));
  }
}
