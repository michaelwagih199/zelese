import 'package:flutter/widgets.dart';
import 'package:zelese/screens/home/homeScreen.dart';
import 'package:zelese/screens/splash/splashScreen.dart';
import 'package:zelese/screens/test/animations/fade.dart';
import 'package:zelese/screens/test/animations/zoom.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => SplashScreen(),
  "/home": (BuildContext context) => HomeScreen(),
};
