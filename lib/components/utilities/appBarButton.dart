import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  
  double fontSize;
  String btnText;
  String fontFamily;
  Color fontColor;
  Decoration decoration;

  final void Function() callback;
  CustomAppBarButton(
    this.btnText,
    this.fontSize,
    this.fontFamily,
    this.fontColor,
    this.decoration,
    this.callback,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: TextButton(
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: fontSize, fontFamily: fontFamily, color: fontColor,fontWeight: FontWeight.bold),
        ),
        onPressed: callback,
      ),
    );
  }
}
