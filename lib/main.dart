import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utils/utils.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Trive',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
            appBarTheme: AppBarTheme(
              color: Color(0xFFFFFFFF),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          onGenerateRoute: RouteManager.generateRoute,
          home: SplashScreen(),
        );
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Add User'),
//         ),
//         body: Center(
//           child: AddUser(firestore),
//         ),
//       ),
//     );
//   }
// }

// class AddUser extends StatefulWidget {
//   final FirebaseFirestore firestore;

//   AddUser(this.firestore);

//   @override
//   State<AddUser> createState() => _AddUserState();
// }

// class _AddUserState extends State<AddUser> {
//   bool _isAddingUser = false;

//   Future<void> _uploadPost() async {
//     setState(() {
//       _isAddingUser = true;
//     });

//     try {
//       await widget.firestore.collection("Users").add({
//         'full_name': 'Example wuwu',
//         'about':
//             "Fundador y CEO de Trive, una startup de LATAM que se ha encargado de ayudar a millones de personas a rellenar textos.",
//         'complete': true,
//       });

//       Mostrar mensaje de éxito al usuario
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Success'),
//             content: Text('User added successfully.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } catch (error) {
//       Mostrar mensaje de error al usuario
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to add user: $error'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } finally {
//       setState(() {
//         _isAddingUser = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isAddingUser
//         ? CircularProgressIndicator() // Mostrar indicador de carga si se está agregando un usuario
//         : TextButton(
//             onPressed: _uploadPost,
//             child: Text(
//               "Add User",
//             ),
//           );
//   }
// }





  