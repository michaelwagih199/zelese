import 'package:flutter/widgets.dart';
import 'package:zelese/screens/home/homeScreen.dart';
import 'package:zelese/screens/splash/splashScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => SplashScreen(),
  "/home": (BuildContext context) => HomeScreen(),
};
