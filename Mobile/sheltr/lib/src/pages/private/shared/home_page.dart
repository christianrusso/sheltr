import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/private/builder/main_builder.dart';
import 'package:sheltr/src/pages/private/manager/main_manager.dart';
import 'package:sheltr/src/pages/private/project/main_page.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sheltr/src/widget/sideMenu.dart';

import 'message_page.dart';
import 'news_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  int _param = 0;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    _param = authService.user.tipoUsuario;

    _index = _index < 4 ? _index : _param;

    return Scaffold(
        endDrawer: MenuCustom(),
        appBar: AppBar(
          title: Container(),
          elevation: 0.0,
        ),
        bottomNavigationBar: _crearNavigationBar(),
        body: Stack(
          children: <Widget>[_loadPages(_index)],
        ));

    //ContainerCustom(),
  }

  Widget _loadPages(int index) {
    switch (index) {
      case 0:
        return _loadPages(_param);
        break;
      case 1:
        return NotificationsPage();
        break;
      case 2:
        return MenssagePage();
        break;
      case 3:
        return NewsPage();
        break;
      case 4:
        return MainProjectPage();
        break;
      case 5:
        return MainManagerPage();
        break;
      case 6:
        return MainBuilderPage();
        break;
      default:
        return Container();
    }
  }

  Widget _crearNavigationBar() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Color(0xff040307),
      strokeColor: Color(0x30040307),
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
            icon: Container(
          child: Image(image: AssetImage('assets/images/icon_main.png')),
          padding: EdgeInsets.all(0.1),
        )),
        CustomNavigationBarItem(
            icon: Container(
          child: Image(image: AssetImage('assets/images/icon_bell.png')),
          padding: EdgeInsets.only(top: 8.0),
        )),
        CustomNavigationBarItem(
            icon: Container(
                child: Image(image: AssetImage('assets/images/icon_mail.png')),
                padding: EdgeInsets.only(top: 8.0))),
        CustomNavigationBarItem(
            icon: Container(
                child: Image(image: AssetImage('assets/images/icon_word.png')),
                padding: EdgeInsets.only(top: 8.0)))
      ],
      currentIndex: _index > 3 ? 0 : _index,
      onTap: (index) {
        setState(() {
          _index = index == 0 ? _param : index;
        });
      },
    );
  }
}
