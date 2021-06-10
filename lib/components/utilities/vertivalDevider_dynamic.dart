import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomVerticalColor extends StatelessWidget {
  final Color color;
  final double height;

  const CustomVerticalColor({@required this.color,@required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 2,
        height: height,
        color: color,
      ),
    );
  }
}
