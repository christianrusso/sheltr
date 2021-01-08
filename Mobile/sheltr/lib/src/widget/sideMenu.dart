import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/private/shared/config_page.dart';
import 'package:sheltr/src/pages/private/shared/contact_page.dart';
import 'package:sheltr/src/pages/private/shared/faq_page.dart';
import 'package:sheltr/src/pages/public/login_page.dart';
import 'package:sheltr/src/pages/private/shared/mapa_page.dart';
import 'package:sheltr/src/pages/private/shared/wallet.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sheltr/src/utilities/utils.dart' as Utils;

class MenuCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 1.0)
              ],
              gradient: LinearGradient(
                  colors: <Color>[Color(0xFFE2E2E2), Color(0xFFFFFFFF)])),
          accountName: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50.0,
                ),
                Text(
                  _authService.user.nombre,
                  style: TextStyle(fontSize: 20.0),
                )
              ]),
          accountEmail: Text(''),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: _authService.user.imagen == ''
                  ? AssetImage('assets/images/no-image.png')
                  : NetworkImage(_authService.user.imagen)),
          otherAccountsPictures: <Widget>[
            GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child:
                    Image(image: AssetImage('assets/images/icon_close.png'))),
          ],
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    MapaPage.routeName,
                  );
                },
                dense: true,
                title: Text("Mapa"),
                leading: new Image.asset(
                  "assets/images/icon_mapa.png",
                  width: 20.0,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    WalletPage.routeName,
                  );
                },
                dense: true,
                title: Text("Wallet"),
                leading: new Image.asset(
                  "assets/images/icon_wallet.png",
                  width: 20.0,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                    context,
                    LoginPage.routeName,
                  );
                },
                dense: true,
                title: Text("Calendario"),
                leading: new Image.asset(
                  "assets/images/icon_calendario.png",
                  width: 20.0,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    ContactPage.routeName,
                  );
                },
                dense: true,
                title: Text("Contacto"),
                leading: new Image.asset(
                  "assets/images/icon_contacto.png",
                  width: 20.0,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    FaqPage.routeName,
                  );
                },
                dense: true,
                title: Text("Preguntas frecuentes"),
                leading: new Image.asset(
                  "assets/images/icon_prefrec.png",
                  width: 20.0,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    ConfiguratioPage.routeName,
                  );
                },
                dense: true,
                title: Text("Configuración"),
                leading: new Image.asset(
                  "assets/images/icon_configuracion.png",
                  width: 20.0,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            final question = await Utils.questionMessage(
                context: context, title: '¿Desea cerrar sesíon?');
            if (question) {
              _authService.signOut();
            }
            //     title: "¿Desea cerrar sesíon?",
            //     confirmButtonColor: Colors.grey[400],
            //     confirmButtonText: "Aceptar",
            //     cancelButtonText: "Cancelar",
            //     showCancelButton: true, onPress: (bool isConfirm) {
            //   if (isConfirm) {
            //     _authService.signOut();
            //   }
            //   Navigator.of(context).pop();
            //   return false;
            // });
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 5.0),
                        spreadRadius: 5.0)
                  ],
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xFFE2E2E2), Color(0xFFFFFFFF)])),
              padding: EdgeInsets.all(40),
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Cerrar Sesión",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ],
    ));
  }
}
