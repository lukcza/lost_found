import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key, required this.width, required this.height, required this.onPressed, required this.text, required this.icon})
      : super(key: key);
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Text text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.amber,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text,
                icon,
              ]
          ),
        ),
      ),
    );
  }
}