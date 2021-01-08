import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/private/project/stages_pages.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/circuleProgress.dart';
import 'package:sheltr/src/widget/sideMenu.dart';
import 'package:sheltr/src/utilities/styles.dart' as Styles;

class DetailsProjectPage extends StatefulWidget {
  static final String routeName = 'detailsproject';
  @override
  _DetailsProjectPageState createState() => _DetailsProjectPageState();
}

class _DetailsProjectPageState extends State<DetailsProjectPage> {
  ProjectService _projectService;
  @override
  Widget build(BuildContext context) {
    _projectService = Provider.of<ProjectService>(context);
    return Scaffold(
      endDrawer: MenuCustom(),
      appBar: AppBar(
        bottom: PreferredSize(
            child: Icon(
              Icons.photo_camera,
              size: 35.0,
              color: Colors.blueAccent,
            ),
            preferredSize: Size.fromHeight(75.0)),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.60), BlendMode.dstATop),
                  image: NetworkImage(_projectService.project.imagenes[0]))),
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          // ContainerCustom(),
          _header(),
          _body(),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.33,
            top: MediaQuery.of(context).size.height * 0.22,
            child: CircleProgressCustom(
              begin: 25,
              end: 25,
              height: 140,
              width: 140,
              outerCircleWidth: 7.0,
              completeArcWidth: 7.0,
              fontSize: 20.0,
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.21,
              top: MediaQuery.of(context).size.height * 0.26,
              child: Container(
                height: 70.0,
                width: 70.0,
                child: Image(image: AssetImage('assets/images/workingman.png')),
              ))
        ],
      ),
    );
  }

  Widget _header() {
    return Positioned(
      left: 20.0,
      top: 40.0,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                '${_projectService.project.nombre[0].toUpperCase()}${_projectService.project.nombre.substring(1)}',
                style: Styles.titlesHeader),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Contrucción",
                          style: Styles.textPragrafIII,
                        )
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
                        Text("Palermo, Buenos Aires",
                            style: Styles.textPragrafIII)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
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
                        Text("Arq. Guillermo Elcano",
                            style: Styles.textPragrafII)
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text("Semana 14", style: Styles.textPragrafIII)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Positioned(
      left: 20.0,
      top: MediaQuery.of(context).size.height * 0.225,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 135,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.2, 3.2),
                      spreadRadius: 3.3)
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, StagesProjectPages.routeName),
                          child: Text(
                            'Etapas',
                            style: Styles.subTitelsHeader,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Icon(Icons.arrow_forward_ios,
                            size: 15.0, color: Colors.blueAccent[700])
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 200.0,
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.date_range,
                      color: Colors.blueAccent[700],
                    )
                  ],
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 180.0,
                      width: 45.0,
                      child:
                          Image(image: AssetImage('assets/images/sptep.png')),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Etapa 3',
                      style: Styles.textPragraf,
                    ),
                    SizedBox(height: 10),
                    Text('Diseño', style: Styles.subTitelsHeader),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.35,
                      child: Text(
                          'Tu PM esta en proceso de diseñar tu refugio. Para mas información, click en "etapas".',
                          style: Styles.textPragraf),
                    ),
                  ],
                )
              ],
            )
          ]),
    );
  }
}
