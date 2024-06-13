import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';
import 'package:trive_bysc/widgets/widgets.dart';
import '../widgets/widgets.dart';
import 'create_account_3.page.dart';

class CreateAccountScreen2 extends StatefulWidget {
  final String email;
  final String password;
  final String repeatPassword;

  const CreateAccountScreen2({
    Key? key,
    required this.email,
    required this.password,
    required this.repeatPassword,
  }) : super(key: key);
  @override
  State<CreateAccountScreen2> createState() => _CreateAccountScreen2State();
}

class _CreateAccountScreen2State extends State<CreateAccountScreen2> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _helpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    print(widget.password);
    print(widget.repeatPassword);
    Size screenSize = MediaQuery.of(context).size;

    bool allFieldsFilled = _nameController.text.isNotEmpty &&
        _occupationController.text.isNotEmpty &&
        _aboutController.text.isNotEmpty &&
        _helpController.text.isNotEmpty;

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
                  containerWidthFactor: 0.45,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Tu Perfil',
                style: TextStyle(
                  fontSize: 25.h,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.h),
              Container(
                height: 300.h,
                child: Stack(
                  children: <Widget>[
                    UserBackgroundWidget(),
                    Positioned(
                      left: 30.w,
                      bottom: 0,
                      child: UserProfileWidget(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextOfInput(label: 'Nombre'),
                    SizedBox(height: 10.h),
                    InputText(
                      label: 'Steve Jobs',
                      borderColor: Colors.black.withOpacity(0.2),
                      borderFocusedColor: primary,
                      controllersc: _nameController,
                    ),
                    SizedBox(height: 10.h),
                    TextOfInput(label: 'Ocupacion'),
                    SizedBox(height: 10.h),
                    InputText(
                      label: 'Ceo de Apple',
                      borderColor: Colors.black.withOpacity(0.2),
                      borderFocusedColor: primary,
                      controllersc: _occupationController,
                    ),
                    SizedBox(height: 10.h),
                    TextOfInput(label: 'Acerca de ti'),
                    SizedBox(height: 10.h),
                    InputText(
                      label: 'Fundador de una empresa de dispositivos el...',
                      borderColor: Colors.black.withOpacity(0.2),
                      borderFocusedColor: primary,
                      controllersc: _aboutController,
                    ),
                    SizedBox(height: 10.h),
                    TextOfInput(label: '¿Cómo puedes ayudar?'),
                    SizedBox(height: 10.h),
                    InputText(
                      label: 'Te puedo ayudar a armar un modelo de neg...',
                      borderColor: Colors.black.withOpacity(0.2),
                      borderFocusedColor: primary,
                      controllersc: _helpController,
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      onClick: allFieldsFilled
                          ? () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CreateAccountScreen3(
                                    email: widget.email,
                                    password: widget.password,
                                    name: _nameController.text,
                                    occupation: _occupationController.text,
                                    about: _aboutController.text,
                                    help: _helpController.text,
                                  ),
                                ),
                              );
                            }
                          : () {
                              _showIncompleteFieldsDialog(context);
                            },
                      title: 'Continuar',
                      backgroundColor: primary,
                      titleColor: Colors.white,
                    ),
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
          title: Center(
            child: Text(
              'Campos Incompletos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          content: Text(
            'Por favor, complete todos los campos antes de continuar.',
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 2.w),
                  decoration: BoxDecoration(
                      color: primary,
                      border: Border.all(width: 2, color: primary),
                      borderRadius: BorderRadius.all(Radius.circular(12.w))),
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _occupationController.dispose();
    _aboutController.dispose();
    _helpController.dispose();
    super.dispose();
  }
}

class TextOfInput extends StatelessWidget {
  final String label;

  const TextOfInput({
    Key? key,
    required this.label,
  }) : super(key: key);

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
