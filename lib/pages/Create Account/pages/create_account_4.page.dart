import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Create%20Account/pages/create_account_5.page.dart';
import 'package:trive_bysc/utils/utils.dart';
import '../widgets/widgets.dart';

import '../../../widgets/widgets.dart';

class CreateAccountScreen4 extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String occupation;
  final String about;
  final String help;
  final List<String> topics;

  const CreateAccountScreen4({
    Key? key,
    required this.email,
    required this.password,
    required this.name,
    required this.occupation,
    required this.about,
    required this.help,
    required this.topics,
  }) : super(key: key);

  @override
  _CreateAccountScreen4State createState() => _CreateAccountScreen4State();
}

class _CreateAccountScreen4State extends State<CreateAccountScreen4> {
  String selectedPrice = '';
  @override
  Widget build(BuildContext context) {
    bool allFieldsFilled = selectedPrice != '';
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
                    numberOfContainers: 3,
                    color: primary,
                    height: 5.h,
                    spacing: 10,
                    containerWidthFactor:
                        0.16, // Esto es un ejemplo, representa 1/5 del ancho de la pantalla
                  )),
              SizedBox(height: 35.h),
              Row(
                children: [
                  Spacer(flex: 5),
                  Text(
                    'Mensajes',
                    style: TextStyle(
                        fontSize: 25.h,
                        fontWeight: FontWeight.bold,
                        color: primary),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  TextButton(onPressed: () {}, child: Text('Omitir')),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Elige el precio de tu mensaje',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Text(
                          'Te conectaremos gratis con personas con intereses y proyectos similares que quieran enviarte mensaje.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 180.h),
              Row(
                children: [
                  Spacer(),
                  CustomButton(
                    onClick: allFieldsFilled
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CreateAccountScreen5(
                                  email: widget.email,
                                  password: widget.password,
                                  name: widget.name,
                                  occupation: widget.occupation,
                                  about: widget.about,
                                  help: widget.help,
                                  topics: widget.topics,
                                  messagePoints: selectedPrice,
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
              )
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
