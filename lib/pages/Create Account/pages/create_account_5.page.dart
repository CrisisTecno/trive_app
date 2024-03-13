import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../widgets/widgets.dart';
import 'create_account_6.page.dart';

class CreateAccountScreen5 extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String occupation;
  final String about;
  final String help;
  final List<String> topics;
  final String messagePoints;

  const CreateAccountScreen5({
    Key? key,
    required this.email,
    required this.password,
    required this.name,
    required this.occupation,
    required this.about,
    required this.help,
    required this.topics,
    required this.messagePoints,
  }) : super(key: key);

  @override
  _CreateAccountScreen5State createState() => _CreateAccountScreen5State();
}

class _CreateAccountScreen5State extends State<CreateAccountScreen5> {
  String selectedPrice = '';

  @override
  Widget build(BuildContext context) {
    bool allFieldsFilled = selectedPrice.isNotEmpty;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: DynamicContainerRow(
                  numberOfContainers: 4,
                  color: primary,
                  height: 5.h,
                  spacing: 10,
                  containerWidthFactor:
                      0.16, // Esto es un ejemplo, representa 1/5 del ancho de la pantalla
                ),
              ),
              SizedBox(height: 35.h),
              Row(
                children: [
                  Spacer(flex: 5),
                  Text(
                    'Llamadas',
                    style: TextStyle(
                      fontSize: 25.h,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(flex: 2),
                  TextButton(onPressed: () {}, child: Text('Omitir')),
                  Spacer(flex: 1),
                ],
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Elige el precio de tu llamada',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Spacer(flex: 3),
                        Text(
                          '<      30 minutos    >',
                          style: TextStyle(
                            fontSize: 20.h,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(flex: 3),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Wrap(
                      spacing: 15.h,
                      runSpacing: 20.h,
                      children: [
                        AmountChip(
                          amount: '100',
                          currency: 'MXN',
                          onAmountSelected: (price) {
                            setState(() {
                              selectedPrice = price;
                            });
                          },
                        ),
                        AmountChip(
                          amount: '200',
                          currency: 'MXN',
                          onAmountSelected: (price) {
                            setState(() {
                              selectedPrice = price;
                            });
                          },
                        ),
                        AmountChip(
                          amount: '300',
                          currency: 'MXN',
                          onAmountSelected: (price) {
                            setState(() {
                              selectedPrice = price;
                            });
                          },
                        ),
                        AmountChip(
                          amount: '400',
                          currency: 'MXN',
                          onAmountSelected: (price) {
                            setState(() {
                              selectedPrice = price;
                            });
                          },
                        ),
                        AmountChip(
                          amount: '500',
                          currency: 'MXN',
                          onAmountSelected: (price) {
                            setState(() {
                              selectedPrice = price;
                            });
                          },
                        ),
                        AmountChip(
                          amount: '600',
                          currency: 'MXN',
                          onAmountSelected: (price) {
                            setState(() {
                              selectedPrice = price;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Text(
                          'Sistema de conexión gratuita',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Text(
                        'Te conectaremos gratis con personas con intereses y proyectos similares que quieran tomar una llamada contigo.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Text(
                          'Sincronizar con mis calendarios',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Text(
                        'Sincroniza con tus calendarios para conocer tu disponibilidad y que se agenden automáticamente tus reuniones',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Spacer(),
                  CustomButton(
                    onClick: allFieldsFilled
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CreateAccountScreen6(
                                  email: widget.email,
                                  password: widget.password,
                                  name: widget.name,
                                  occupation: widget.occupation,
                                  about: widget.about,
                                  help: widget.help,
                                  topics: widget.topics,
                                  messagePoints: widget.messagePoints,
                                  callPoints: selectedPrice,
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
                  Spacer(),
                ],
              ),
              SizedBox(height: 30.h),
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
          title: Text('Selecciona un Plan'),
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
}
