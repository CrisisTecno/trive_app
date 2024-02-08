import 'package:flutter/material.dart';

import '../../pages/pages.dart';


class RouteManager {

  static const String settingsPage = '/settings';
  static const String splashscreen = '/splash';
  static const String homePage = '/';
  static const String createaccount1 = '/createaccount1';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case createaccount1:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen1());
      default:
        throw FormatException("Route not found");
    }
  }
}
