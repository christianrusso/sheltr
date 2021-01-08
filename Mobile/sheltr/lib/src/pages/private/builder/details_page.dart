import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/model/project.dart';
import 'package:sheltr/src/pages/private/builder/stage_calendar.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/circuleProgress.dart';
import 'package:sheltr/src/widget/sideMenu.dart';
import 'package:sheltr/src/utilities/styles.dart' as Styles;

class DetailsBuildPage extends StatefulWidget {
  static final String routeName = 'detailsbuild';

  @override
  _DetailsBuildPageState createState() => _DetailsBuildPageState();
}

class _DetailsBuildPageState extends State<DetailsBuildPage> {
  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectService>(context);
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
                  image: NetworkImage(projectProvider.project.imagenes[0]))),
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          // ContainerCustom(),
          _header(projectProvider.project),
          _body(),
          _builderProjectIndicator(context),
          _builderDecoratorIndicator(context)
        ],
      ),
    );
  }

  Positioned _builderDecoratorIndicator(BuildContext context) {
    return Positioned(
        left: MediaQuery.of(context).size.width * 0.21,
        top: MediaQuery.of(context).size.width * 0.65,
        child: Container(
          height: 70.0,
          width: 70.0,
          child: Image(image: AssetImage('assets/images/workingman.png')),
        ));
  }

  Positioned _builderProjectIndicator(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.33,
      top: MediaQuery.of(context).size.width * 0.56,
      child: CircleProgressCustom(
        begin: 25,
        end: 25,
        height: 140,
        width: 140,
        outerCircleWidth: 7.0,
        completeArcWidth: 7.0,
        fontSize: 20.0,
      ),
    );
  }

  Widget _header(Project project) {
    return Positioned(
      left: 20.0,
      top: MediaQuery.of(context).size.height * 0.10,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(project.nombre, style: Styles.titlesHeader),
            SizedBox(
              height: 30,
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
                          Icons.location_on,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text("Palermo, Buenos Aires",
                            style: Styles.textPragrafII)
                      ],
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
                          Icons.person,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text("Paul Sanchez ", style: Styles.textPragrafII)
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
                        Text("Semana 14", style: Styles.textPragrafII)
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
      top: MediaQuery.of(context).size.height * 0.284,
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
              height: 20.0,
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
                              context, StageCalendarBuildPage.routeName),
                          child: Text(
                            'Calendario',
                            style: Styles.subTitelsHeader,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Icon(Icons.arrow_forward_ios,
                            size: 15.0, color: Colors.blueAccent[700])
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
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
            SizedBox(
              height: 10,
            ),
          ]),
    );
  }
}
