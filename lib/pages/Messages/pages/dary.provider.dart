import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  void scheduleAppointment() {
    _isScheduled = true;
    notifyListeners();
  }

  void cancelAppointment() {
    _isScheduled = false;
    notifyListeners();
  }
}
