import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation heartbeatAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    heartbeatAnimation =
        Tween<double>(begin: 0.0, end: 300.0).animate(controller);
    controller.forward().whenComplete(() {
      // controller.reverse();
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: AppStyleConfig.appColors['primary'],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(width / 8, 0, width / 8, 0),
                  child: AnimatedBuilder(
                    animation: heartbeatAnimation,
                    builder: (context, widget) {
                      return Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.scaleDown,
                        width: heartbeatAnimation.value,
                        height: heartbeatAnimation.value,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: width / 8),
                  child: Text(
                    '‫‪MY‬‬ ‫‪COMFORT‬‬ ‫‪PARTNER‬‬',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        color: AppStyleConfig.appColors['pink']),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
