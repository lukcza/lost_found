
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LostItemAddPage extends StatefulWidget {
  const LostItemAddPage({Key? key}) : super(key: key);

  @override
  State<LostItemAddPage> createState() => _LostItemAddPageState();
}

class _LostItemAddPageState extends State<LostItemAddPage> {
  File? _image;
  Future getImageCamera()async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if( image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }
  Future getImageGallery()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if( image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => getImageGallery(),
                      icon: Icon(Icons.photo),
                      iconSize: 160,
                    ),
                    IconButton(
                      onPressed: ()=>getImageCamera(),
                      icon: Icon(Icons.photo_camera),
                      iconSize: 160,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          width: 1,
                        )),
                    hintText: "description..."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
