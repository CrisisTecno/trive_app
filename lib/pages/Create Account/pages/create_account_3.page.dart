import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Create%20Account/pages/create_account_4.page.dart';
import 'package:trive_bysc/utils/utils.dart';
import '../widgets/widgets.dart';

import '../../../widgets/widgets.dart';

class CreateAccountScreen3 extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String occupation;
  final String about;
  final String help;

  const CreateAccountScreen3({
    Key? key,
    required this.email,
    required this.password,
    required this.name,
    required this.occupation,
    required this.about,
    required this.help,
  }) : super(key: key);
  @override
  State<CreateAccountScreen3> createState() => _CreateAccountScreen3State();
}

class _CreateAccountScreen3State extends State<CreateAccountScreen3> {
  List<String> selectedChips = [];

  @override
  Widget build(BuildContext context) {
    bool allFieldsFilled = selectedChips.isNotEmpty;
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
                    numberOfContainers: 2,
                    color: primary,
                    height: 5.h,
                    spacing: 10,
                    containerWidthFactor:
                        0.16, // Esto es un ejemplo, representa 1/5 del ancho de la pantalla
                  )),
              SizedBox(height: 35.h),
              Row(
                children: [
                  Spacer(),
                  Text(
                    'Tus Intereses',
                    style: TextStyle(
                        fontSize: 25.h,
                        fontWeight: FontWeight.bold,
                        color: primary),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Negocios y Emprendimiento',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.h),
                      ReusableChips(
                        chipLabels: [
                          'Marketing',
                          'Finanzas',
                          'Ventas',
                          'Publicidad',
                          'Liderazgo',
                          'Bienestar'
                        ],
                        onSelectedLabelsChanged: (selectedLabels) {
                          setState(() {
                            selectedChips.addAll(selectedLabels);
                            selectedChips = selectedChips.toSet().toList();
                          });
                        },
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Desarrollo Personal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.h),
                      ReusableChips(
                        chipLabels: [
                          'Salud',
                          'Bienestar',
                          'Relaciones',
                        ],
                        onSelectedLabelsChanged: (selectedLabels) {
                          setState(() {
                            selectedChips.addAll(selectedLabels);
                            selectedChips = selectedChips.toSet().toList();
                          });
                        },
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Tecnología y Ciencia',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.h),
                      ReusableChips(
                        chipLabels: [
                          'Marketing',
                          'Finanzas',
                          'Ventas',
                          'Publicidad',
                          'Liderazgo',
                          'Bienestar'
                        ],
                        onSelectedLabelsChanged: (selectedLabels) {
                          setState(() {
                            selectedChips.addAll(selectedLabels);
                            selectedChips = selectedChips.toSet().toList();
                          });
                        },
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
                                builder: (context) => CreateAccountScreen4(
                                  email: widget.email,
                                  password: widget.password,
                                  name: widget.name,
                                  occupation: widget.occupation,
                                  about: widget.about,
                                  help: widget.help,
                                  topics: selectedChips,
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
          title: Text('Selecciona como minimo un topico'),
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
