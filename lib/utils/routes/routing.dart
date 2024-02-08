import 'package:flutter/material.dart';

import '../../pages/pages.dart';


class RouteManager {

  static const String settingsPage = '/settings';
  static const String splashscreen = '/splash';
  static const String homePage = '/';
  static const String createaccount1 = '/createaccount1';
  static const String createaccount2 = '/createaccount2';
  static const String createaccount3 = '/createaccount3';
  static const String createaccount4 = '/createaccount4';
  static const String createaccount5 = '/createaccount5';
  static const String createaccount6 = '/createaccount6';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case createaccount1:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen1());
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
      default:
        throw FormatException("Route not found");
    }
  }
}
