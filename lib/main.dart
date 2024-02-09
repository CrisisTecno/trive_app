import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Trive',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        appBarTheme: AppBarTheme(
          color: Color(0xFFFFFFFF),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
          onGenerateRoute: RouteManager.generateRoute,
          home: SplashScreen(),
        );
      },
    );
  }
}
