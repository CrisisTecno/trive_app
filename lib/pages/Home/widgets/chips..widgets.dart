import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';

import '../../../widgets/widgets.dart';

class CarruselSocial extends StatefulWidget {
  @override
  State<CarruselSocial> createState() => _CarruselSocialState();
}

class _CarruselSocialState extends State<CarruselSocial> {
  Future<QuerySnapshot>? _data;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final triveProvider = Provider.of<TriveProvider>(context, listen: false);

      if (triveProvider.userId == null) {
        setState(() {
          _data = FirebaseFirestore.instance
              .collection('Users')
              .where(
                FieldPath.documentId,
              )
              .get();
        });
      } else {
        setState(() {
          _data = FirebaseFirestore.instance
              .collection('Users')
              .where(FieldPath.documentId, isNotEqualTo: triveProvider.userId)
              .get();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            List<DocumentSnapshot<Object?>> users = snapshot.data!.docs;
            users.forEach((userSnapshot) {
              print(userSnapshot.data());
            });

            return Container(
              width: double.infinity,
              height: 350.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var userSnapshot = users[index];
                  var userData = userSnapshot.data() as Map<String, dynamic>;
                  int followersCount =
                      (userData['followers'] as List<dynamic>).length - 1;
                  String nroFollowers = followersCount.toString();
                  String personId = userSnapshot.id;
                  print("User ID: ${userSnapshot.id}");
                  print("nro. followers " + nroFollowers);
                  print(userData['name']);
                  print(userData['occupation']);

                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CardConexion(
                      nroFollowers: nroFollowers,
                      title: userData['name'] ?? '',
                      about: userData['occupation'] ?? '',
                      userId: personId,
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
