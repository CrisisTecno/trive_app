import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Create%20Account/pages/login_account_1.page.dart';

import '../../pages/pages.dart';

class RouteManager {
  static const String settingsPage = '/settings';
  static const String splashscreen = '/splash';
  static const String homePage = '/home';
  static const String createaccount1 = '/createaccount1';
  static const String createaccount2 = '/createaccount2';
  static const String createaccount3 = '/createaccount3';
  static const String createaccount4 = '/createaccount4';
  static const String createaccount5 = '/createaccount5';
  static const String createaccount6 = '/createaccount6';
  static const String chat = '/chat';
  static const String buypoint = '/buypoint';
  static const String notification = '/notification';
  static const String post_screen = '/postScreen';
  static const String meeting = '/meeting';
  static const String dairy = '/dairy';
  static const String person_profile = '/person_profile';

  static const String person_profile = '/person_profile';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case createaccount1:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen1());
      case login:
        return MaterialPageRoute(builder: (context) => LoginAccountScreen1());
      case createaccount2:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen2());
      case createaccount3:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen3());
      case createaccount4:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen4());
      case createaccount5:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen5());
      case createaccount6:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen6());
      case homePage:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case chat:
        return MaterialPageRoute(builder: (context) => MessagesChatScreen());
      case buypoint:
        return MaterialPageRoute(builder: (context) => BuyPointsScreen());
      case notification:
        return MaterialPageRoute(builder: (context) => NotificationScreen());
      case post_screen:
        return MaterialPageRoute(builder: (context) => PostScreen());
      case meeting:
        return MaterialPageRoute(builder: (context) => MeetingDetailsPage());
      case dairy:
        return MaterialPageRoute(builder: (context) => DairyPage());
      default:
        throw FormatException("Route not found");
    }
  }
}
