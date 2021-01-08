import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/public/register_page.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sweetalert/sweetalert.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Size _size;
  bool _hidePass = true;
  AuthService _authService;
  IconData _icon = Icons.visibility;
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          height: _size.height,
          width: _size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF176CF2),
                Color(0xFF4187F7),
                Color(0xFF40A0F0),
                Color(0xFF59C0EE),
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: _size.height * 0.10, left: _size.width * 0.35),
                child: Container(
                  child: Image(image: AssetImage('assets/images/hlogin.png')),
                ),
              ),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(top: _size.height * 0.30, left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(70.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: TextField(
              controller: _username,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(70.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(
                    color: Colors.black54, fontFamily: 'MyriadPro'),
                hintText: "Email",
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(
                  30.0,
                  3.0,
                  3.0,
                  3.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(70.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: TextField(
              obscureText: _hidePass,
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      _icon,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        _icon = (_icon == Icons.visibility)
                            ? Icons.visibility_off
                            : Icons.visibility;
                        _hidePass = !_hidePass;
                      });
                    }),
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(70.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(
                    color: Colors.black54, fontFamily: 'MyriadPro'),
                hintText: "Contraseña",
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(
                  30.0,
                  3.0,
                  3.0,
                  3.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'MyriadPro',
                      color: Colors.white),
                  text: "¿Olvidaste tu contraseña? ",
                ),
              ),
              onPressed: () {
                print('click--olvido');
              }),
          SizedBox(
            height: 30.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(70.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white10],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Iniciar Sesión",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'MyriadPro',
                        fontSize: 19.0),
                  ),
                ),
              ),
              onPressed: () {
                _login(context, _username.text, _password.text);
              },
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                  text: "¿No tenes cuenta? ",
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Registrate',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MyriadPro',
                            fontWeight: FontWeight.w600,
                            fontSize: 19))
                  ],
                ),
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, RegisterPage.routeName)),
        ],
      ),
    );
  }

  void _login(BuildContext context, String username, String password) async {
    var user = await _authService.firebaseSignIn(username, password);

    if (user == null) {
      SweetAlert.show(context,
          style: SweetAlertStyle.error,
          title: "Error",
          subtitle: "Usuario o contraseña incorrecta");
    }
  }
}
