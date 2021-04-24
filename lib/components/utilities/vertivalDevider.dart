import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomVerticalDevider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 1,
        height: double.maxFinite,
        color: Colors.white,
      ),
    );
  }
}
