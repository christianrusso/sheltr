import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/model/project.dart';
import 'package:sheltr/src/pages/private/manager/datails_page.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/circuleProgress.dart';
import 'package:sheltr/src/utilities/utils.dart' as Utils;
import 'package:sheltr/src/utilities/styles.dart' as Styles;

class MainManagerPage extends StatefulWidget {
  static final String routeName = 'mainmanager';

  @override
  _MainManagerPageState createState() => _MainManagerPageState();
}

class _MainManagerPageState extends State<MainManagerPage> {
  AuthService _authService;
  ProjectService _projectService;
  @override
  Widget build(BuildContext context) {
    _authService = Provider.of<AuthService>(context);
    _projectService = Provider.of<ProjectService>(context);

    return Stack(
      children: <Widget>[_header(), _body(context)],
    );
    //ContainerCustom()
  }

  Widget _header() {
    return Positioned(
      left: 30.0,
      top: 5.0,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                var list = await Utils.loadAssets(maxImagenes: 1);
                await _authService.uploadImages(list[0]);
                setState(() {});
              },
              child: CachedNetworkImage(
                imageUrl: _authService.user.imagen,
                imageBuilder: (context, imageProvider) =>
                    mainAvatar(imageProvider),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    mainAvatar(AssetImage('assets/images/no-image.jpg')),
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
                  width: 225.0,
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
                          "Project Manager",
                          style: Styles.textPragrafII,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "3/5",
                          style: Styles.textPragrafII,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 15.0,
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
                          style: Styles.textPragrafII,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "+ Mi Porfolio",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Proyectos', style: TextStyle(fontSize: 25.0))
          ],
        ),
      ),
    );
  }

  CircleAvatar mainAvatar(ImageProvider<Object> imageProvider) {
    return CircleAvatar(
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
      backgroundImage: imageProvider,
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.35, left: 7.0),
      child: Container(
        width: MediaQuery.of(context).size.height * 0.49,
        child: StreamBuilder(
            stream: _projectService.getProyectByIdManager(_authService.user.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final projects =
                  Projects.fromFirestoreList(snapshot.data.documents);

              if (projects.items.length == 0) {
                return Center(
                  child: Text('No tiene proyectos asignados'),
                );
              }
              final itemsAceptados =
                  projects.items.where((e) => e.estado >= 2).toList();
              final itemsPendientes =
                  projects.items.where((e) => e.estado == 1).toList();
              return Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                          child: ListView.builder(
                        itemCount: itemsAceptados.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              dense: true,
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    itemsAceptados[index].imagenes[0]),
                              ),
                              onTap: () {
                                _projectService.project = itemsAceptados[index];
                                Navigator.pushNamed(
                                    context, DetailsManagerPage.routeName);
                              },
                              title: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    itemsAceptados[index].nombre,
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
                                  begin: 25,
                                  end: 25,
                                  completeArcWidth: 4.0,
                                  outerCircleWidth: 2.0,
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                    ],
                  ),
                  itemsPendientes.length > 0
                      ? BottomModal(itemsPendientes)
                      : Container()
                ],
              );
            }),
      ),
    );
  }
}

class BottomModal extends StatelessWidget {
  final List<Project> items;

  BottomModal(this.items);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            child: ListItems(scrollController, items),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          );
        });
  }
}

class ListItems extends StatelessWidget {
  final ScrollController scrollController;
  final List<Project> items;

  ListItems(this.scrollController, this.items);

  @override
  Widget build(BuildContext context) {
    final project = Provider.of<ProjectService>(context);

    return ListView.builder(
      padding: EdgeInsets.only(top: 15),
      controller: scrollController,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            dense: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(items[index].imagenes[0]),
            ),
            onTap: () async {
              project.project = items[index];
              final question = await Utils.questionMessage(
                  context: context,
                  title: '¿ Acepta el proyecto ?',
                  subtitle:
                      'Una vez realiza esta accion no prodra volver atras.',
                  titleCancel: 'Rechazar');
              if (question) {
                project.updateStutus(2);
              } else {
                project.updateStutus(0);
              }
            },
            title: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  items[index].nombre,
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
                padding: EdgeInsets.symmetric(vertical: 10),
                child:
                    Text('Nuevo', style: TextStyle(color: Colors.blueAccent))),
          ),
        );
      },
    );
  }
}
