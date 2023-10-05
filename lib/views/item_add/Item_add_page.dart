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
  Key pageKeyController = GlobalKey();
  PageController _pageController = PageController();
  var _isVisibleFloatingButton;
  Future toImagePage() async {
    await _pageController.animateToPage(1,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  void onPageChanged(int page) {
    if (page == 1) {
      setState(() {
        _isVisibleFloatingButton = false;
      });
    } else {
      setState(() {
        _isVisibleFloatingButton = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isVisibleFloatingButton = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        key: pageKeyController,
        controller: _pageController,
        onPageChanged: (pageController) => onPageChanged(pageController),
        scrollDirection: Axis.vertical,
        children: [
          const FormPage(),
          const ImagePickerPage(),
        ],
      ),
      floatingActionButton: Visibility(
        visible: _isVisibleFloatingButton,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           /* Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "to set image",
                  style: TextStyle(color: Colors.grey),
                )),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  disabledElevation: 0,
                  onPressed: toImagePage,
                  /*backgroundColor: Colors.grey.withOpacity(0),
                  shape: const CircleBorder(side: BorderSide.none),*/
                  /*child: Row(
                    children: [
                      Text("set image"),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  )*/

                ),
              ],
            )
          ],
        ),
        /*child: FloatingActionButton(

          foregroundColor: null,
          backgroundColor: ,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.zero
          ),
            onPressed:()=>toImagePage(),
            child: Icon(Icons.arrow_downward),
        ),*/
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
