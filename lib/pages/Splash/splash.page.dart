import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';
import 'package:trive_bysc/utils/utils.dart';
import '../../widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          color: primary,
        ),
        child: Column(
          children: [
            SizedBox(height: 150.h),
            Image.asset('public/assets/images/trive_logo_splash.png'),
            SizedBox(height: 100.h),
            CustomButton(
              title: 'Iniciar sesión',
              titleColor: Color(0xff222222),
              backgroundColor: Color(0xffFFFFFF),
              onClick: () {
                Navigator.of(context).pushNamed(RouteManager.login);
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              title: 'Crear tu cuenta',
              titleColor: Color(0xffFFFFFF),
              backgroundColor: Color(0xff222222),
              onClick: () {
                Navigator.of(context).pushNamed(RouteManager.createaccount1);
              },
            ),
          ],
        ),
      )),
    );
  }
}
