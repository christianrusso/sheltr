import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/model/project.dart';
import 'package:sheltr/src/pages/private/project/details_page.dart';
import 'package:sheltr/src/pages/private/project/init_page.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/circuleProgress.dart';
import 'package:sheltr/src/utilities/styles.dart' as Styles;
import 'package:sheltr/src/utilities/utils.dart' as Utils;

class MainProjectPage extends StatefulWidget {
  static final String routeName = 'mainproject';
  @override
  _MainProjectPage createState() => _MainProjectPage();
}

class _MainProjectPage extends State<MainProjectPage> {
  AuthService _auth;
  ProjectService _projectService;

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<AuthService>(context);
    _projectService = Provider.of<ProjectService>(context);

    return Stack(
      children: <Widget>[
        _header(),
        Container(
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          width: 300,
          child: StreamBuilder(
              stream: _projectService.getProyectByIdUser(_auth.user.id),
              builder: (context, snapshot) {
                List<Project> projects = [];

                if (snapshot.hasData) {
                  final List<DocumentSnapshot> items = snapshot.data.documents;
                  items.forEach((item) {
                    final model = Project.fromFirestore(item);
                    projects.add(model);
                  });
                }
                return GridView.count(
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 30.0,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.27),
                    crossAxisCount: 2,
                    children: _items(projects));
              }),
        )
      ],
    );
  }

  Widget _header() {
    return Positioned(
      left: 35.0,
      top: 5.0,
      child: Container(
        child: GestureDetector(
          onTap: () async {
            var list = await Utils.loadAssets(maxImagenes: 1);
            if (list != null) {
              await _auth.uploadImages(list[0]);
              setState(() {});
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: _auth.user.imagen,
                imageBuilder: (context, imageProvider) =>
                    mainAvatar(imageProvider),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    mainAvatar(AssetImage('assets/images/no-image.jpg')),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  '${_auth.user.nombre[0].toUpperCase()}${_auth.user.nombre.substring(1)}',
                  style: Styles.titlesHeader),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 15,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "Villa Crespo,Cabas",
                    style: Styles.textPragraf,
                  )
                ],
              ),
              SizedBox(height: 5.0),
              Text(
                'Mis Proyectos',
                style: Styles.subTitelsHeader,
              ),
            ],
          ),
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

  List<Widget> _items(List<Project> items) {
    final content = <Widget>[];

    items.forEach((item) {
      content.add(GestureDetector(
        onTap: () {
          _projectService.project = item;
          Navigator.pushNamed(context, DetailsProjectPage.routeName);
        },
        child: CachedNetworkImage(
          imageUrl: _auth.user.imagen,
          imageBuilder: (context, imageProvider) => new Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(item.imagenes[0]), fit: BoxFit.cover),
            ),
            child: Card(
                color: Colors.white70,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      item.nombre,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    CircleProgressCustom(begin: 25, end: 25)
                  ],
                )),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ));
    });

    content.add(
      new GestureDetector(
        onTap: () => Navigator.pushNamed(context, InitProjectPage.routeName),
        child: new Container(
          margin: EdgeInsets.only(left: 3.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 3.0),
                    spreadRadius: 3.0)
              ]),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.blue,
              size: 35.0,
            ),
          ),
        ),
      ),
    );

    return content;
  }
}
