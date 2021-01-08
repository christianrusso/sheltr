import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/public/login_page.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sweetalert/sweetalert.dart';

class RegisterPage extends StatefulWidget {
  static final String routeName = 'register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Size _size;
  bool _hidePass = true;
  IconData _icon = Icons.visibility;
  AuthService _auth;
  TextEditingController _nombreController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _auth = Provider.of<AuthService>(context);
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
              controller: _nombreController,
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
                hintText: "Nombre y Apellido",
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
            child: TextField(
              controller: _emailController,
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
              controller: _passwordController,
              obscureText: _hidePass,
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
            height: 40.0,
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
                    "Registrarme",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'MyriadPro',
                        fontSize: 19.0),
                  ),
                ),
              ),
              onPressed: () {
                _register(context, _nombreController.text,
                    _emailController.text, _passwordController.text);
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
                  text: "¿Ya tenes una cuenta? ",
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Inicia Sesion',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MyriadPro',
                            fontWeight: FontWeight.w600,
                            fontSize: 19))
                  ],
                ),
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, LoginPage.routeName)),
        ],
      ),
    );
  }

  void _register(BuildContext context, String nombre, String username,
      String password) async {
    final user = await _auth.firebaseRegister(nombre, username, password);

    if (user != null) {
      _auth.status = AuthStatus.Registred;
      Navigator.pop(context);
    } else {
      SweetAlert.show(context,
          style: SweetAlertStyle.error,
          title: "Error",
          subtitle: "Error al registrar el usuario ");
    }
  }
}
