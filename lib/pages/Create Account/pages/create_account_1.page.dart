import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';

import 'create_account_2.page.dart';

class CreateAccountScreen1 extends StatefulWidget {
  const CreateAccountScreen1({super.key});

  @override
  State<CreateAccountScreen1> createState() => _CreateAccountScreen1State();
}

class _CreateAccountScreen1State extends State<CreateAccountScreen1> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    bool allFieldsFilled = _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _repeatPasswordController.text.isNotEmpty;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
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
                      borderFocusedColor: primary,
                      controllersc: _emailController,
                    ),
                    SizedBox(height: 20.h),
                    TextLeyend(text: 'Contraseña'),
                    SizedBox(height: 10.h),
                    InputText(
                      label: 'Contraseña',
                      icon: Icon(Icons.remove_red_eye_outlined),
                      borderColor: Colors.black.withOpacity(0.2),
                      borderFocusedColor: primary,
                      controllersc: _passwordController,
                    ),
                    SizedBox(height: 20.h),
                    TextLeyend(text: 'Repetir Contraseña'),
                    SizedBox(height: 10.h),
                    InputText(
                      label: ' Repetir Contraseña',
                      icon: Icon(Icons.remove_red_eye_outlined),
                      borderColor: Colors.black.withOpacity(0.2),
                      borderFocusedColor: primary,
                      controllersc: _repeatPasswordController,
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      child: Text(
                        'Crea tu cuenta',
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 18.h),
                      ),
                      onPressed: allFieldsFilled
                          ? _passwordController.text ==
                                  _repeatPasswordController.text
                              ? () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CreateAccountScreen2(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        repeatPassword:
                                            _repeatPasswordController.text,
                                      ),
                                    ),
                                  );
                                }
                              : () {
                                  _showIncompleteFieldsDialogRepeat(context);
                                }
                          : () {
                              _showIncompleteFieldsDialog(context);
                            },
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

  void _showIncompleteFieldsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Campos Incompletos'),
          content:
              Text('Por favor, complete todos los campos antes de continuar.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showIncompleteFieldsDialogRepeat(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Los campos no coinciden'),
          content:
              Text('Por favor, verifique los campos y vuelva a intentarlo'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
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
      style:
          TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: primary),
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
