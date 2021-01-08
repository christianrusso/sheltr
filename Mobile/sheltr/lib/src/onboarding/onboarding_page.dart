import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sheltr/src/utilities/styles.dart' as Styles;

class OnboardingPage extends StatefulWidget {
  static final String routeName = 'onboarding';
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 8.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF4C4C4C) : Color(0xFF918F8F),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget _wizard(String pathImage, String title, String description) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Text(
            title,
            style: Styles.titlesHeader,
          )),
          Center(
            child: Image(
              image: AssetImage(
                pathImage,
              ),
              height: 200.0,
              width: 200.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Styles.textPragraf,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 27.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () =>
                        _authService.status = AuthStatus.Unauthenticated,
                    child: Icon(
                      Icons.cancel,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      _wizard('assets/images/onb1.png', '¡Nuevo proyecto!',
                          'Para crear un proyecto nuevo necesitaremos que contestes una breve encuesta'),
                      _wizard('assets/images/onb3.png', 'Etapas',
                          'Dentro de cada etapa el PM a cargo, dejara foto y comentarios y ¡usted podrá responder!'),
                      _wizard('assets/images/onb5.png', 'Calendario',
                          'Aquí podrás ver lo que sucede día a día en tu proyecto (obras, trabajadores, etc)'),
                      _wizard('assets/images/onb6.png', 'Ticket',
                          '¡Llegó la hora de hacer tu primer pago! Y así poder pasar a la siguiente etapa '),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Siguiente',
                                  style: TextStyle(
                                    color: Color(0xFF176CF2),
                                    fontSize: 19.0,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF176CF2),
                                  size: 17.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Color(0xFF176CF2),
              child: GestureDetector(
                onTap: () => _authService.status = AuthStatus.Unauthenticated,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Entendido',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
