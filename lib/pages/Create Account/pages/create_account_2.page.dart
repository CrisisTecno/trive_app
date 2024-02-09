import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';
import '../widgets/widgets.dart';

class CreateAccountScreen2 extends StatefulWidget {
  @override
  State<CreateAccountScreen2> createState() => _CreateAccountScreen2State();
}

class _CreateAccountScreen2State extends State<CreateAccountScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: DynamicContainerRow(
                    numberOfContainers: 1,
                    color: primary,
                    height: 5.h,
                    spacing: 10,
                    containerWidthFactor:
                       0.16,  // Esto es un ejemplo, representa 1/5 del ancho de la pantalla
                  )),
              SizedBox(height: 15.h),
              Text(
                'Tu Perfil',
                style: TextStyle(
                    fontSize: 25.h,
                    fontWeight: FontWeight.bold,
                    color: primary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.h),
              Container(
                height: 300.h,
                child: Stack(
                  children: <Widget>[
                    UserBackgroundWidget(),
                    Positioned(
                        left: 30.w, bottom: 0, child: UserProfileWidget()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextOfInput(
                      label: 'Nombre',
                    ),
                    SizedBox(height: 10.h),
                    InputText(
                        label: 'Steve Jobs',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 10.h),
                    TextOfInput(
                      label: 'Ocupacion',
                    ),
                    SizedBox(height: 10.h),
                    InputText(
                        label: 'Ceo de Apple',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 10.h),
                    TextOfInput(
                      label: 'Acerca de ti',
                    ),
                    SizedBox(height: 10.h),
                    InputText(
                        label: 'Fundador de una empresa de dispositivos el...',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 10.h),
                    TextOfInput(
                      label: '¿Cómo puedes ayudar?',
                    ),
                    SizedBox(height: 10.h),
                    InputText(
                        label: 'Te puedo ayudar a armar un modelo de neg...',
                        borderColor: Colors.black.withOpacity(0.2),
                        borderFocusedColor: primary),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onClick: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.createaccount3);
                      },
                      title: 'Continuar',
                      backgroundColor: primary,
                      titleColor: Colors.white,
                    )
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

class TextOfInput extends StatelessWidget {
  final String label;
  const TextOfInput({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        label,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20.h,
          fontWeight: FontWeight.bold,
          color: primary,
        ),
      ),
    );
  }
}
