import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_found/views/item_add/pages/form_page.dart';
import 'package:lost_found/views/item_add/pages/image_picker_page.dart';

class LostItemAddPage extends StatefulWidget {
  const LostItemAddPage({Key? key}) : super(key: key);

  @override
  State<LostItemAddPage> createState() => _LostItemAddPageState();
}

class _LostItemAddPageState extends State<LostItemAddPage> {

  Key pageKeyController =  GlobalKey();
  PageController pageController = PageController();
  var _isVisibleFloatingButton;
  Future toImagePage()async{
    await pageController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.linear);
    if(pageController.initialPage + 1 == 1){
      _isVisibleFloatingButton = false;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isVisibleFloatingButton = true;
  }

  @override
  Widget build(BuildContext context){


    return  Scaffold(
      body: PageView(
        key: pageKeyController,
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
            FormPage(),
            ImagePickerPage(),
        ],
      ),
      floatingActionButton: Visibility(
        visible: _isVisibleFloatingButton,
        child: FloatingActionButton(
            onPressed:()=>toImagePage(),
            child: Icon(Icons.arrow_downward),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child:
        ),
      ),
    );
  }*/
}
