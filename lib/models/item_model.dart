import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickedData extends ChangeNotifier {
  File? myImage;
  late String downloadedURL;
  late String title;
  late String description;
  late bool itemState; //true = ended
  Future updateURLValue(String newURL) async {
    try {
      downloadedURL = await newURL;
      notifyListeners();
    } catch (e) {
      print('error: $e');
    }
  }

  Future<void> updateImageValue(Future<File> newValue) async {
    try {
      File file = await newValue;
      myImage = file;
      notifyListeners();
    } catch (e) {
      print('error: $e');
    }
  }
}
