import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../widgets/widgets.dart';

class CreateAccountScreen6 extends StatefulWidget {
  final String email;
  final String password;
  final String name;
  final String occupation;
  final String about;
  final String help;
  final List<String> topics;
  final String callPoints;
  final String messagePoints;

  const CreateAccountScreen6({
    Key? key,
    required this.email,
    required this.password,
    required this.name,
    required this.occupation,
    required this.about,
    required this.help,
    required this.topics,
    required this.callPoints,
    required this.messagePoints,
  }) : super(key: key);

  @override
  State<CreateAccountScreen6> createState() => _CreateAccountScreen6State();
}

class _CreateAccountScreen6State extends State<CreateAccountScreen6> {
  String selectedPrice = '';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> _uploadPost() async {
    try {
      final Timestamp timestamp = Timestamp.now();
      final int callPoints = int.parse(widget.callPoints);
      final int messagePoints = int.parse(widget.messagePoints);

      // Crear un nuevo documento en la colección "Users"
      DocumentReference docRef = await firestore.collection("Users").add({
        'email': widget.email,
        'password': widget.password,
        'name': widget.name,
        'occupation': widget.occupation,
        'about': widget.about,
        'help': widget.help,
        'topics': widget.topics,
        'callPoints': callPoints,
        'created': timestamp,
        'image': '',
        'portada': '',
        'phone': null,
        'countryCode': '',
        'followers': [],
        'following': [],
        'degree': null,
        'ip': null,
        'lastName': null,
        'lastlogin': null,
        'messages': false,
        'messagesPrice': messagePoints,
        'notificationToken': null,
        'organization': null,
        'password2': '',
        'rol': '',
      });

      // Obtener el UID generado para el documento creado
      String uid = docRef.id;

      // Crear el usuario en la autenticación de Firebase con el mismo UID
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );

      // Obtener el usuario actualmente autenticado
      User? user = FirebaseAuth.instance.currentUser;

      // Actualizar el UID del usuario autenticado con el UID generado
      if (user != null) {
        await user.updateDisplayName(uid);
      }

      // Mostrar el diálogo de éxito
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User added successfully.'),
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
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add user: $error'),
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

  // Future<void> _uploadPost() async {
  //   try {
  //     final Timestamp timestamp = Timestamp.now();
  //     final int callPoints = int.parse(widget.callPoints);
  //     final int messagePoints = int.parse(widget.messagePoints);

  //     // Crear un nuevo documento en la colección "Users"
  //     await firestore.collection("Users").add({
  //       'email': widget.email,
  //       'password': widget.password,
  //       'name': widget.name,
  //       'occupation': widget.occupation,
  //       'about': widget.about,
  //       'help': widget.help,
  //       'topics': widget.topics,
  //       'callPoints': callPoints,
  //       'created': timestamp,
  //       'countryCode': '',
  //       'countryName': '',
  //       'degree': null,
  //       'followers': [],
  //       'following': [],

  //       // 'freeCalls': true,
  //       // 'freeConnect': true,
  //       // 'freeMessage': true,
  //       'image': '',
  //       'ip': null,
  //       'lastName': null,
  //       'lastlogin': null,
  //       'messages': false,
  //       'messagesPrice': messagePoints,
  //       'notificationToken': null,
  //       'organization': null,
  //       'password2': '',
  //       'phone': null,
  //       'portada': '',
  //       'rol': '',
  //     });

  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Success'),
  //           content: Text('User added successfully.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pushNamed(RouteManager.homePage);
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  @override
  void initState() {
    super.initState();
    selectedPrice = widget.callPoints;
  }

  @override
  Widget build(BuildContext context) {
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
                  numberOfContainers: 5,
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
                    'Subscripcion',
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
                      'Elige el precio de tu suscripción',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
                          'Código para acceder',
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
                        'Solo podrán suscribirse los que tengan un código de acceso',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 150.h),
              Row(
                children: [
                  Spacer(),
                  CustomButton(
                    onClick: _uploadPost,
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
}
