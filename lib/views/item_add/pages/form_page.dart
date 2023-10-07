import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lost_found/views/item_add/pages/image_picker_page.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../models/item_model.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File? image = Provider.of<ImagePickedData>(context).myImage;
    TextEditingController descriptionController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 220, left: 20, right: 20),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.amber,
                          width: 1,
                        )),
                    hintText: "Item name"),
              ),
              const SizedBox(
                height: 20,
              ),
              /*TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.amber,
                          width: 1,
                        )),
                    hintText: "Place of withdrawal"),
              ),
              const SizedBox(
                height: 10,
              ),*/
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.amber,
                          width: 1,
                        )),
                    hintText:
                        "Description. For example, you can describe here where you found these items."),
              ),
              ElevatedButton(
                  onPressed: () => {
                        image != null
                            ? uploadFoundItemWithImage(image, context)
                            : uploadFoundItem()
                      },
                  child: Text('send'))
            ],
          )),
      //floatingActionButton: IconButton(onPressed: , icon: icon),
    );
  }

  Future uploadFoundItemWithImage(File image, BuildContext context) async {
    final firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('path/to/your/file.jpg');
    final task = storageRef.putFile(image);
    final String downloadUrl =
        await task.then((snapshot) => snapshot.ref.getDownloadURL());
    Provider.of<ImagePickedData>(context).downloadedURL;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    print('upload done with image');
  }

  Future uploadFoundItem() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    print('upload done');
  }
}
