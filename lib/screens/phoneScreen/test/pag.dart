import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zelese/screens/CLINICALLY/CLINICALLY.dart';
import 'package:zelese/screens/EFFICACY/EFFICACY.dart';
import 'package:zelese/screens/TOLERABILITY/TOLERABILITY.dart';
import 'package:zelese/screens/indication/indicationScreen.dart';
import 'package:zelese/screens/whatIsZelese/whatIsZelesse.dart';

class Pge extends StatefulWidget {
  @override
  _PgeState createState() => _PgeState();
}

class _PgeState extends State<Pge> {
  PageController controller = PageController();
  List<Widget> _list = <Widget>[
    new IndicationScreen(),
    new WhatIsZelesse(),
    new EFFICACY(),
    new TOLERABILITY(),
    new CLINICALLY(),
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: _list,
      scrollDirection: Axis.horizontal,
      // reverse: true,
      physics: BouncingScrollPhysics(),
      controller: controller,
      onPageChanged: (num) {
        print(num);
        setState(() {
          log('$num');
        });
      },
    );
  }
}
