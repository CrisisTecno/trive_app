import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TriveProvider with ChangeNotifier {
  Map<String, dynamic>? _userData;
  String? _userId;

  Map<String, dynamic>? get userData => _userData;
  String? get userId => _userId;

  void setUserData(String userId, Map<String, dynamic> data) {
    _userData = data;
    _userId = userId;
    notifyListeners();
  }

  void clearUserData() {
    _userData = null;
    _userId = null;
    notifyListeners();
  }
}
