import 'package:flutter/cupertino.dart';
import 'package:sheltr/src/onboarding/onboarding_page.dart';
import 'package:sheltr/src/pages/private/builder/details_page.dart';
import 'package:sheltr/src/pages/private/builder/main_builder.dart';
import 'package:sheltr/src/pages/private/builder/stage_calendar.dart';
import 'package:sheltr/src/pages/private/manager/datails_page.dart';
import 'package:sheltr/src/pages/private/manager/main_manager.dart';
import 'package:sheltr/src/pages/private/manager/satage_step_page.dart';
import 'package:sheltr/src/pages/private/manager/stage_blueprint_page.dart';
import 'package:sheltr/src/pages/private/manager/stage_calendar.dart';
import 'package:sheltr/src/pages/private/manager/stage_execute_page.dart';
import 'package:sheltr/src/pages/private/manager/stages_desing_page.dart';
import 'package:sheltr/src/pages/private/manager/stages_pages.dart';
import 'package:sheltr/src/pages/private/project/add_page.dart';
import 'package:sheltr/src/pages/private/project/details_page.dart';
import 'package:sheltr/src/pages/private/project/init_page.dart';
import 'package:sheltr/src/pages/private/project/main_page.dart';
import 'package:sheltr/src/pages/private/project/stage_calendar_page.dart';
import 'package:sheltr/src/pages/private/project/stage_desing_page.dart';
import 'package:sheltr/src/pages/private/project/stages_pages.dart';
import 'package:sheltr/src/pages/private/shared/config_page.dart';
import 'package:sheltr/src/pages/private/shared/contact_page.dart';
import 'package:sheltr/src/pages/private/shared/faq_page.dart';
import 'package:sheltr/src/pages/private/shared/home_page.dart';
import 'package:sheltr/src/pages/private/shared/mapa_page.dart';
import 'package:sheltr/src/pages/private/shared/message/chats_page.dart';
// import 'package:sheltr/src/pages/private/shared/message/message_page.dart';
import 'package:sheltr/src/pages/private/shared/news_page.dart';
import 'package:sheltr/src/pages/private/shared/notification_page.dart';
import 'package:sheltr/src/pages/private/shared/wallet.dart';
import 'package:sheltr/src/pages/public/login_page.dart';
import 'package:sheltr/src/pages/private/shared/perfil_page.dart';
import 'package:sheltr/src/pages/public/register_page.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    'onboarding': (BuildContext contex) => OnboardingPage(),
    'login': (BuildContext contex) => LoginPage(),
    'register': (BuildContext contex) => RegisterPage(),
    'home': (BuildContext contex) => HomePage(),
    'mainproject': (BuildContext contex) => MainProjectPage(),
    'configuration': (BuildContext contex) => ConfiguratioPage(),
    'addproject': (BuildContext contex) => AddProjectPage(),
    'detailsproject': (BuildContext contex) => DetailsProjectPage(),
    'stagesproject': (BuildContext contex) => StagesProjectPages(),
    'stagedesingpage': (BuildContext context) => StageDesingPage(),
    'stagecalendarpage': (BuildContext context) => StageCalendarPage(),
    'mainmanager': (BuildContext context) => MainManagerPage(),
    'detailsmanager': (BuildContext context) => DetailsManagerPage(),
    'stagesmanager': (BuildContext context) => StagesManagerPages(),
    'stagesstepmanager': (BuildContext context) => StagesStepManagerPages(),
    'stagesblueprint': (BuildContext context) => StageBlueprintManagerPage(),
    'stagedesingmanager': (BuildContext context) => StageDesingManagerPage(),
    'stagecalendarmanager': (BuildContext context) =>
        StageCalendarManagerPage(),
    'mainbuildpage': (BuildContext context) => MainBuilderPage(),
    'detailsbuild': (BuildContext context) => DetailsBuildPage(),
    'stagecalendarbuildpage': (BuildContext context) =>
        StageCalendarBuildPage(),
    'faq': (BuildContext context) => FaqPage(),
    'contact': (BuildContext context) => ContactPage(),
    'wallet': (BuildContext context) => WalletPage(),
    'mapa': (BuildContext context) => MapaPage(),
    'notifications': (BuildContext context) => NotificationsPage(),
    'news': (BuildContext context) => NewsPage(),
    // 'message': (BuildContext context) => MenssagePage(),
    // 'messagedetails': (BuildContext context) => MessageDetailPage(),
    'perfil': (BuildContext context) => PerfilPage(),
    'initproject': (BuildContext context) => InitProjectPage(),
    'stagesexecutemanager': (BuildContext context) => StageExecuteManagerPage(),
    'chats' :(BuildContext context) => ChatsPage(),
   };
}
