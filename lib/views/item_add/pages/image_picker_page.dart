import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

import '../../../models/item_model.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  Future<File> getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) throw Error();

    final imageTemporary = File(image.path);

    return imageTemporary;
  }

  Future<File> getImageGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) throw Error();
    final imageTemporary = File(image.path);
    return imageTemporary;
  }

  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<ImagePickedData>(context);
    File? image = imageProvider.myImage;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(60)),
                border: Border(
              top: BorderSide(
                color: Colors.amber,
                width: 2,
              ),
              bottom: BorderSide(
                color: Colors.amber,
                width: 2,
              ),
              left: BorderSide(
                color: Colors.amber,
                width: 3,
              ),
              right: BorderSide(
                color: Colors.amber,
                width: 3,
              ),
            )),
            child: image != null
                ? Image.file(image!)
                : const Icon(
                    Icons.image_not_supported_rounded,
                    size: 220,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.values.last,
            children: [
              IconButton(
                onPressed: () =>
                    imageProvider.updateImageValue(getImageGallery()),
                icon: const Icon(
                  Icons.image,
                  color: Colors.green,
                ),
                iconSize: 80,
              ),
              IconButton(
                onPressed: () =>
                    imageProvider.updateImageValue(getImageCamera()),
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.amberAccent,
                ),
                iconSize: 80,
              ),
            ],
          )
        ],
      ),
    );
  }
}
