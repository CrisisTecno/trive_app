import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';

class LoginAccountScreen1 extends StatefulWidget {
  const LoginAccountScreen1({Key? key}) : super(key: key);

  @override
  _LoginAccountScreen1State createState() => _LoginAccountScreen1State();
}

class _LoginAccountScreen1State extends State<LoginAccountScreen1> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  String _errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _errorMessage = '';
    });

    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('Usuario inició sesión: ${userCredential.user}');

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: emailController.text.trim())
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        print("el usuario existe");
        final userProvider = Provider.of<TriveProvider>(context, listen: false);
        var doc = querySnapshot.docs.first;
        userProvider.setUserData(
            doc.id, querySnapshot.docs.first.data() as Map<String, dynamic>);
      } else {
        print("el usuario no existe");
      }
      ;

      //´por defecto
      // final userCredential =
      //     await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: 'tecn0crisis0@gmail.com',
      //   password: 'SCristhian69*',
      // );
      // print('Usuario inició sesión: ${userCredential.user}');

      // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      //     .collection('Users')
      //     .where('email', isEqualTo: 'tecn0crisis0@gmail.com')
      //     .get();
      // if (querySnapshot.docs.isNotEmpty) {
      //   print("el usuario existe");
      //   final userProvider = Provider.of<TriveProvider>(context, listen: false);
      //   var doc = querySnapshot.docs.first;
      //   userProvider.setUserData(
      //       doc.id, querySnapshot.docs.first.data() as Map<String, dynamic>);
      // } else {
      //   print("el usuario no existe");
      // }

      Navigator.of(context).pushNamed(RouteManager.homePage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _errorMessage = 'No se encontró un usuario con ese correo.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _errorMessage = 'Contraseña incorrecta.';
        });
      } else {
        setState(() {
          _errorMessage = 'Ocurrio un error, Credenciales Invalidas';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
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
                      'Inicia Sesion',
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
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary, // Color del borde
                            width: 1.0, // Ancho del borde
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                                .withOpacity(0.2), // Color del borde
                            width: 1.0, // Ancho del borde
                          ),
                        ),
                        // Configura el padding dentro del TextField:
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextLeyend(text: 'Contraseña'),
                    SizedBox(height: 10.h),
                    TextField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Contraseña',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primary, // Color del borde
                            width: 1.0, // Ancho del borde
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                                .withOpacity(0.2), // Color del borde
                            width: 1.0, // Ancho del borde
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    SizedBox(height: 50.h),
                    ElevatedButton(
                      child: Text(
                        'Continuar',
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 18.h),
                      ),
                      onPressed: _signIn,
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
                    // SizedBox(height: 30.h),
                    // // SocialSignInButton(
                    // //   text: 'Iniciar sesión con Facebook',
                    // //   iconPath: 'public/assets/icons/facebook.svg',
                    // //   color: Colors.white,
                    // //   titleColor: Colors.black,
                    // //   onPressed: () {},
                    // // ),
                    // // SizedBox(height: 15),
                    // SocialSignInButton(
                    //   text: 'Iniciar sesión con Google',
                    //   iconPath: 'public/assets/icons/google.svg',
                    //   color: Colors.white,
                    //   titleColor: Colors.black,
                    //   onPressed: () {},
                    // ),
                    // SizedBox(height: 15),
                    // SocialSignInButton(
                    //   text: 'Inicia sesión con Apple',
                    //   iconPath: 'public/assets/icons/apple.svg',
                    //   color: Colors.black,
                    //   titleColor: Colors.white,
                    //   onPressed: () {},
                    // ),
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
