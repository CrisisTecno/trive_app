import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage(File image) async {
  print(image.path);

  return false;
}
