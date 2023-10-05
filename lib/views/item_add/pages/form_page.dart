import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:lost_found/views/item_add/pages/image_picker_page.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  
  //TODO: implement send items to firebase
  Future uploadFoundItemWithImage( File image) async{
    final firebase_storage.Reference storageRef =
    firebase_storage.FirebaseStorage.instance.ref().child('path/to/your/file.jpg');
    final task = storageRef.putFile(image);
    final String downloadUrl = await task.then((snapshot) => snapshot.ref.getDownloadURL());
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
  }
  Future uploadFoundItem() async{
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
  }
  @override

  @override
  Widget build(BuildContext context) {
    File? image = Provider.of<ImagePickedData>(context).myImage;
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 220, left: 20, right: 20),
            child: Column(
              children: [
                TextField(
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
                TextField(
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
                ),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 1,
                          )),
                      hintText: "Description..."),
                ),
                ElevatedButton(onPressed:()=> {image != null?uploadFoundItemWithImage(image) : uploadFoundItem()}, child: Text('send'))
              ],
            )
        ),
      //floatingActionButton: IconButton(onPressed: , icon: icon),
    );
  }
}
