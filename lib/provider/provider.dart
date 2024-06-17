import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TriveProvider with ChangeNotifier {
  Map<String, dynamic>? _userData;
  String? _userId;
  String? _personId;

  Map<String, dynamic>? get userData => _userData;
  String? get userId => _userId;
  String? get personId => _personId;

  void setUserData(String userId, Map<String, dynamic> data) {
    _userData = data;
    _userId = userId;
    _personId = userId;
    notifyListeners();
  }

  void setPersonData(String personId) {
    _personId = personId;
    notifyListeners();
  }

  void clearUserData() {
    _userData = null;
    _userId = null;
    _personId = null;
    notifyListeners();
  }

  Future<List<DocumentSnapshot>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where(FieldPath.documentId, isNotEqualTo: _userId)
          .get();
      print(querySnapshot.docs);
      return querySnapshot.docs;
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }
}
