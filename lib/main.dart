
import 'package:flutter/material.dart';
import 'package:zelese/routes.dart';
import 'package:zelese/theme/style.dart';

void main() {
  runApp(ZeleseApp());
}

class ZeleseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      initialRoute: '/',
      routes: routes,
    );
  }


}



