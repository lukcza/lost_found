import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);
  @override
  // TODO: implement key
  Key? get key => super.key;
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
              ],
            )
        ),
      //floatingActionButton: IconButton(onPressed: , icon: icon),
    );
  }
}
