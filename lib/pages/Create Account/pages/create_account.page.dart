import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';

class CreateAccountScreen1 extends StatelessWidget {
  const CreateAccountScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: ListView(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Crea tu cuenta',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Prepárate para aumentar tu red de contactos',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 50.h),
                    TextLeyend(text: 'Correo'),
                    SizedBox(height: 10.h),
                    InputText(
                        label: 'Correo',
                        icon: Icon(Icons.email_outlined),
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 20.h),
                    TextLeyend(text: 'Contraseña'),
                    SizedBox(height: 10.h),
                    InputText(
                        label: 'Contraseña',
                        icon: Icon(Icons.remove_red_eye_outlined),
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 20.h),
                    TextLeyend(text: 'Repetir Contraseña'),
                    SizedBox(height: 10.h),
                    InputText(
                        label: ' Repetir Contraseña',
                        icon: Icon(Icons.remove_red_eye_outlined),
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 50),
                    ElevatedButton(
                      child: Text(
                        'Crea tu cuenta',
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 18.h),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      height: 30,
                      child: Stack(children: [
                        Divider(),
                        Positioned(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                'O',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                          left: screensize.width * 0.42,
                          top: -6,
                        ),
                      ]),
                    ),
                    SizedBox(height: 30.h),
                    SocialSignInButton(
                      text: 'Iniciar sesión con Facebook',
                      iconPath: 'public/assets/icons/facebook.svg',
                      color: Colors.white,
                      titleColor: Colors.black,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    SocialSignInButton(
                      text: 'Iniciar sesión con Google',
                      iconPath: 'public/assets/icons/google.svg',
                      color: Colors.white,
                      titleColor: Colors.black,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15),
                    SocialSignInButton(
                      text: 'Inicia sesión con Apple',
                      iconPath: 'public/assets/icons/apple.svg',
                      color: Colors.black,
                      titleColor: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextLeyend extends StatelessWidget {
  final text;
  const TextLeyend({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff0228B9)),
      textAlign: TextAlign.start,
    );
  }
}

class SocialSignInButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color color;
  final Color titleColor;
  final VoidCallback onPressed;

  const SocialSignInButton({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.color,
    required this.onPressed,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 35.0,
            width: 35.0,
          ),
          SizedBox(width: 20.h),
        ],
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: titleColor,
        ),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(titleColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5)),
      ),
    );
  }
}
