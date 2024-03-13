import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Create%20Account/pages/create_account_4.page.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../../widgets/widgets.dart';
import '../../../pages.dart';

class EditProfile2 extends StatefulWidget {
  final String userId;
  final String name;
  final String occupation;
  final String about;
  final String help;

  const EditProfile2({
    Key? key,
    required this.name,
    required this.occupation,
    required this.about,
    required this.help,
    required this.userId,
  }) : super(key: key);
  @override
  State<EditProfile2> createState() => _EditProfile2State();
}

class _EditProfile2State extends State<EditProfile2> {
  List<String> selectedChips = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> getUserID() async {
    try {
      print(widget.userId);

      await updateUser(widget.userId);
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to modify user: $error'),
            actions: [
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

  Future<void> updateUser(String userID) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(userID).update({
        'name': widget.name,
        'occupation': widget.occupation,
        'about': widget.about,
        'help': widget.help,
        'topics': selectedChips,
      }).then((value) => print("User Updated"));

      // Mostrar el diálogo de éxito
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User updated successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.homePage);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      // Mostrar el diálogo de error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to update user: $error'),
            actions: [
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

  @override
  Widget build(BuildContext context) {
    bool allFieldsFilled = selectedChips.isNotEmpty;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.h),
              Row(
                children: [
                  Spacer(),
                  Text(
                    'Edita Tus Intereses',
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
                    onClick: () {
                      if (allFieldsFilled) {
                        getUserID();
                      } else {
                        _showIncompleteFieldsDialog(context);
                      }
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
