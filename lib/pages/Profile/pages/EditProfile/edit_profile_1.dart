// import 'package:flutter/material.dart';
// import 'package:trive_bysc/utils/utils.dart';
// import 'package:trive_bysc/widgets/widgets.dart';
// import '../../../pages.dart';
// import 'edit_profile_2.dart';

// class EditProfile1 extends StatefulWidget {
//   final String email;
//   final String password;

//   const EditProfile1({
//     Key? key,
//     required this.email,
//     required this.password,
//   }) : super(key: key);
//   @override
//   State<EditProfile1> createState() => _EditProfile1State();
// }

// class _EditProfile1State extends State<EditProfile1> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _occupationController = TextEditingController();
//   TextEditingController _aboutController = TextEditingController();
//   TextEditingController _helpController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;

//     bool allFieldsFilled = _nameController.text.isNotEmpty &&
//         _occupationController.text.isNotEmpty &&
//         _aboutController.text.isNotEmpty &&
//         _helpController.text.isNotEmpty;

//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 15.h),
//               Text(
//                 'Editar tu Perfil',
//                 style: TextStyle(
//                   fontSize: 25.h,
//                   fontWeight: FontWeight.bold,
//                   color: primary,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 15.h),
//               Container(
//                 height: 300.h,
//                 child: Stack(
//                   children: <Widget>[
//                     UserBackgroundWidget(),
//                     Positioned(
//                       left: 30.w,
//                       bottom: 0,
//                       child: UserProfileWidget(),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     TextOfInput(label: 'Nombre'),
//                     SizedBox(height: 10.h),
//                     InputText(
//                       label: 'Steve Jobs',
//                       borderColor: Colors.black.withOpacity(0.2),
//                       borderFocusedColor: primary,
//                       controllersc: _nameController,
//                     ),
//                     SizedBox(height: 10.h),
//                     TextOfInput(label: 'Ocupacion'),
//                     SizedBox(height: 10.h),
//                     InputText(
//                       label: 'Ceo de Apple',
//                       borderColor: Colors.black.withOpacity(0.2),
//                       borderFocusedColor: primary,
//                       controllersc: _occupationController,
//                     ),
//                     SizedBox(height: 10.h),
//                     TextOfInput(label: 'Acerca de ti'),
//                     SizedBox(height: 10.h),
//                     InputText(
//                       label: 'Fundador de una empresa de dispositivos el...',
//                       borderColor: Colors.black.withOpacity(0.2),
//                       borderFocusedColor: primary,
//                       controllersc: _aboutController,
//                     ),
//                     SizedBox(height: 10.h),
//                     TextOfInput(label: '¿Cómo puedes ayudar?'),
//                     SizedBox(height: 10.h),
//                     InputText(
//                       label: 'Te puedo ayudar a armar un modelo de neg...',
//                       borderColor: Colors.black.withOpacity(0.2),
//                       borderFocusedColor: primary,
//                       controllersc: _helpController,
//                     ),
//                     SizedBox(height: 30.h),
//                     CustomButton(
//                       onClick: allFieldsFilled
//                           ? () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => EditProfile2(
//                                     email: widget.email,
//                                     password: widget.password,
//                                     name: _nameController.text,
//                                     occupation: _occupationController.text,
//                                     about: _aboutController.text,
//                                     help: _helpController.text,
//                                   ),
//                                 ),
//                               );
//                             }
//                           : () {
//                               _showIncompleteFieldsDialog(context);
//                             },
//                       title: 'Continuar',
//                       backgroundColor: primary,
//                       titleColor: Colors.white,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showIncompleteFieldsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Campos Incompletos'),
//           content:
//               Text('Por favor, complete todos los campos antes de continuar.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _occupationController.dispose();
//     _aboutController.dispose();
//     _helpController.dispose();
//     super.dispose();
//   }
// }

// class TextOfInput extends StatelessWidget {
//   final String label;

//   const TextOfInput({
//     Key? key,
//     required this.label,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 15),
//       child: Text(
//         label,
//         textAlign: TextAlign.start,
//         style: TextStyle(
//           fontSize: 20.h,
//           fontWeight: FontWeight.bold,
//           color: primary,
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/widgets.dart';
import '../../../pages.dart';
import 'edit_profile_2.dart';

class EditProfile1 extends StatefulWidget {
  final String userId;

  const EditProfile1({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<EditProfile1> createState() => _EditProfile1State();
}

class _EditProfile1State extends State<EditProfile1> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _helpController = TextEditingController();

  late Future<DocumentSnapshot> _userData;

  @override
  void initState() {
    super.initState();
    _userData = _fetchUserData();
  }

  Future<DocumentSnapshot> _fetchUserData() async {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.userId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    bool allFieldsFilled = _nameController.text.isNotEmpty &&
        _occupationController.text.isNotEmpty &&
        _aboutController.text.isNotEmpty &&
        _helpController.text.isNotEmpty;

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
          future: _userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return Center(child: Text('No data found'));
            }

            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15.h),
                  Text(
                    'Editar tu Perfil',
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
                          label: userData['name'],
                          borderColor: Colors.black.withOpacity(0.2),
                          borderFocusedColor: primary,
                          controllersc: _nameController,
                        ),
                        SizedBox(height: 10.h),
                        TextOfInput(label: 'Ocupacion'),
                        SizedBox(height: 10.h),
                        InputText(
                          label: userData['occupation'],
                          borderColor: Colors.black.withOpacity(0.2),
                          borderFocusedColor: primary,
                          controllersc: _occupationController,
                        ),
                        SizedBox(height: 10.h),
                        TextOfInput(label: 'Acerca de ti'),
                        SizedBox(height: 10.h),
                        InputText(
                          label: userData['about'],
                          borderColor: Colors.black.withOpacity(0.2),
                          borderFocusedColor: primary,
                          controllersc: _aboutController,
                        ),
                        SizedBox(height: 10.h),
                        TextOfInput(label: '¿Cómo puedes ayudar?'),
                        SizedBox(height: 10.h),
                        InputText(
                          label: userData['help'],
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
                                      builder: (context) => EditProfile2(
                                        userId: widget.userId,
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
            );
          },
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
