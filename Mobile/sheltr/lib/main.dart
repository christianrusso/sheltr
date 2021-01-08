import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sheltr/src/onboarding/onboarding_page.dart';
import 'package:sheltr/src/pages/private/shared/home_page.dart';
import 'package:sheltr/src/pages/public/login_page.dart';
import 'package:sheltr/src/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/services/authservice.dart';
import 'package:sheltr/src/services/builderservice.dart';
import 'package:sheltr/src/services/managerservice.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/utilities/utils.dart' as Utils;

int iniScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  final _presf = Utils.PreferenciasUsuario();
  await _presf.initPrefs();
  runApp(Sheltr());
}

class Sheltr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pref = Utils.PreferenciasUsuario();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService.instance()),
        ChangeNotifierProvider(create: (_) => new ProjectService()),
        ChangeNotifierProvider(create: (_) => new ManagerService()),
        ChangeNotifierProvider(create: (_) => new BuilderService())
      ],
      child: MaterialApp(
        title: 'Sheltr',
        debugShowCheckedModeBanner: false,
        routes: getApplicationsRoutes(),
        home: Consumer(
          builder: (context, AuthService authService, _) {
            switch (authService.status) {
              case AuthStatus.Uninitialized:
                return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              case AuthStatus.Registred:
                return HomePage();
              case AuthStatus.Authenticated:
                return HomePage();
              case AuthStatus.Unauthenticated:
                if (_pref.initPage == 0 || _pref.initPage == null) {
                  _pref.initPage = 1;
                  return OnboardingPage();
                } else {
                  return LoginPage();
                }
            }
            return null;
          },
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [const Locale('es'), const Locale('en')],
        theme: ThemeData(primaryColor: Color(0xFFFFFFFF)),
      ),
    );
  }
}
