import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _image;

  Future getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Future getImageGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
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
              child: _image != null
                  ? Image.file(_image!)
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
                  onPressed: () => getImageGallery(),
                  icon: const Icon(
                    Icons.image,
                    color: Colors.green,
                  ),
                  iconSize: 80,
                ),
                IconButton(
                  onPressed: () => getImageCamera(),
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
      ),
    );
  }
}
