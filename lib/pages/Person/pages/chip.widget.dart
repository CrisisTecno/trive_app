import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';

import '../../../widgets/widgets.dart';

class CarruselSocial1 extends StatefulWidget {
  @override
  State<CarruselSocial1> createState() => _CarruselSocialState();
}

class _CarruselSocialState extends State<CarruselSocial1> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final triveProvider = Provider.of<TriveProvider>(context, listen: false);
    List<Map<String, dynamic>> combinedData = [];

    try {
      print(triveProvider.personId);
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(triveProvider.personId)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        List<String> followers = List<String>.from(userData['followers']);

        for (String followerId in followers) {
          DocumentSnapshot followerSnapshot = await FirebaseFirestore.instance
              .collection('Users')
              .doc(followerId)
              .get();
          print(followerId);

          if (followerSnapshot.exists) {
            Map<String, dynamic> followerData =
                followerSnapshot.data() as Map<String, dynamic>;
            followerData['id'] = followerId;
            combinedData.add(followerData);
          }
        }

        setState(() {
          _data = combinedData;
          print("Data: $_data");
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _data.isEmpty
          ? Center(
              child: _data == null || _data.isEmpty
                  ? Text(
                      'No se encontraron conexiones',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  : CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              height: 350.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  var userData = _data[index];
                  int followersCount =
                      (userData['followers'] as List<dynamic>).length;
                  String nroFollowers = followersCount.toString();
                  String personId = userData['id'];
                  // print("User ID: ${userSnapshot.id}");
                  // print("nro. followers " + nroFollowers);
                  // print(userData['name']);
                  // print(userData['mainImage']);
                  // print(userData['occupation']);

                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CardConexion(
                      nroFollowers: nroFollowers,
                      url: userData['mainImage'],
                      title: userData['name'] ?? '',
                      about: userData['occupation'] ?? '',
                      userId: personId,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
