import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zelese/components/buttomBar/customBottomBar.dart';
import 'package:zelese/components/topBar/customTopBar.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         SafeArea(
           child: Column(
            children: [
              CustomTopBar(),
              CustomBottomBar(),
            ],
        ),
         ),
      
    );
  }
}
