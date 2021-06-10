import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/components/utilities/fractilySize.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController c;

  @override
  void initState() {
    super.initState();
    c = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => {
            c.resync(this),
            Future.delayed(Duration(seconds: 2)).then((value) {
              Navigator.of(context).pushReplacementNamed("/home");
            })
          });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppStyleConfig.appColors['backgrounLight'],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (builder, constraints) {
            if (width < 600) {
              return phoneColumn(width, height);
            } else {
              return tabletView(width, height);
            }
          },
        ),
      ),
    );
  }

  Container tabletView(double width, double h) {
    return Container(
      width: width,
      height: h,
      margin: EdgeInsets.all(20),
      child: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(20),
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    'assets/images/splashTxt.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: SlideTransition(
                  position: AnimationTween.fromTop(c),
                  child: Image.asset(
                    'assets/images/vector1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: Image.asset('assets/images/logoCompany1.png',
                        fit: BoxFit.scaleDown),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container phoneColumn(double width, double h) {
    return Container(
      width: width,
      height: h,
      margin: EdgeInsets.all(10),
      child: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(50, 5, 50, 5),
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset('assets/images/logo.png',
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SlideTransition(
                position: AnimationTween.fromRight(c),
                child: Text(
                  '‫‪MY‬‬ ‫‪COMFORT‬‬ ‫‪PARTNER‬‬',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Roboto',
                      color: AppStyleConfig.appColors['pink']),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: Image.asset('assets/images/vector1.png',
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: Image.asset('assets/images/logoCompany1.png',
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    c.dispose();
  }
}
