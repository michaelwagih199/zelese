import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zelese/components/buttomBar/customBottomBar.dart';
import 'package:zelese/components/topBar/customTopBar.dart';
import 'package:zelese/screens/test/pag.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 60, child: CustomTopBar()),
            Expanded(
              flex: 10,
              child: Pge(),
            ),
            Container(height: 50, child: CustomBottomBar()),
          ],
        ),
      ),
    );
  }
}
