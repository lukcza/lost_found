import 'dart:js';

import 'package:flutter/material.dart';
import 'package:lost_found/views/item_add/pages/image_picker_page.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);
  // TODO: implement key

  //TODO: implement send items to firebase
  Future uploadItemToFirestore() async{

  }
  @override

  @override
  Widget build(BuildContext context) {
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
                ElevatedButton(onPressed:()=> print("siuuuu"), child: Text('send'))
              ],
            )
        ),
      //floatingActionButton: IconButton(onPressed: , icon: icon),
    );
  }
}
