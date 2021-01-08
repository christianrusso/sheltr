import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/model/project.dart';
import 'package:sheltr/src/pages/private/builder/details_page.dart';
import 'package:sheltr/src/services/authservice.dart';

import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/circuleProgress.dart';
import 'package:sheltr/src/utilities/styles.dart' as Styles;
import 'package:sheltr/src/utilities/utils.dart' as Utils;

class MainBuilderPage extends StatefulWidget {
  static final String routeName = 'mainbuildpage';
  @override
  _MainBuilderPageState createState() => _MainBuilderPageState();
}

class _MainBuilderPageState extends State<MainBuilderPage> {
  AuthService _authService;
  @override
  Widget build(BuildContext context) {
    _authService = Provider.of<AuthService>(context);
    return Stack(
      children: <Widget>[_header(), _body(context)],
    );
    //ContainerCustom(),
  }

  Widget _header() {
    return Positioned(
      left: 30.0,
      top: MediaQuery.of(context).size.height * 0.08,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                var list = await Utils.loadAssets(maxImagenes: 1);
                await _authService.uploadImages(list[0]);
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(top: 68.0, left: 65.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.blueAccent,
                      size: 25.0,
                    ),
                  ),
                ),
                radius: 50.0,
                backgroundImage: _authService.user.imagen == ''
                    ? AssetImage('assets/images/no-image.jpg')
                    : NetworkImage(_authService.user.imagen),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_authService.user.nombre, style: Styles.titlesHeader),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                Icon(
                  Icons.today,
                  color: Colors.blueAccent,
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Builder /Plomero",
                          style: Styles.textPragrafIII,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Palermo, Buenos Aires",
                          style: Styles.textPragrafIII,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Proyectos', style: Styles.subTitelsHeader),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    final projectBuilder = Provider.of<ProjectService>(context);
    final user = Provider.of<AuthService>(context);

    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.45, left: 7.0),
      child: Container(
        width: MediaQuery.of(context).size.height * 0.49,
        child: FutureBuilder(
            future: projectBuilder.getProjectsByIdBuilders(user.user.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final projects =
                  Projects.fromFirestoreList(snapshot.data.documents).items;

              if (projects.length == 0) {
                return Center(
                  child: Text('No tiene proyectos asignados'),
                );
              }
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: projects.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            dense: true,
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(projects[index].imagenes[0]),
                            ),
                            onTap: () {
                              projectBuilder.project = projects[index];
                              Navigator.of(context)
                                  .pushNamed(DetailsBuildPage.routeName);
                            },
                            title: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  projects[index].nombre,
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 13.0,
                                  color: Colors.blueAccent,
                                )
                              ],
                            ),
                            trailing: Container(
                              height: 100.0,
                              width: 100.0,
                              child: CircleProgressCustom(
                                end: 25,
                                completeArcWidth: 4.0,
                                outerCircleWidth: 2.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
