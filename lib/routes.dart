
import 'package:flutter/widgets.dart';
import 'package:zelese/screens/home/homeScreen.dart';
import 'package:zelese/screens/test/homeScreen.dart';

final Map<String,WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
};
