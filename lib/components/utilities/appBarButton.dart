import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  double fontSize;
  String btnText;
  String fontFamily;
  final void Function() callback;
  CustomAppBarButton(
      this.btnText, this.fontSize,this.fontFamily, this.callback,);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          btnText,
          style: TextStyle(fontSize: fontSize, fontFamily: fontFamily,color: Colors.white),
        ),
        onPressed: callback,
      ),
    );
  }
}
