import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zelese/components/animations/animationsTween.dart';
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
      backgroundColor: AppStyleConfig.appColors['primary'],
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
       margin: EdgeInsets.all(10),
      child: Builder(
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
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
            Expanded(
              child: Container(
                child: SlideTransition(
                  position: AnimationTween.fromTop(c),
                  child: Image.asset(
                    'assets/images/vvv.png',
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SlideTransition(
                position: AnimationTween.fromRight(c),
                child: Text(
                  '‫‪MY‬‬ ‫‪COMFORT‬‬ ‫‪PARTNER‬‬',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: AppStyleConfig.appColors['pink']),
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: SlideTransition(
                position: AnimationTween.fromLeft(c),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.scaleDown
                ),
              ),
            ),
            Container(
              child: SlideTransition(
                position: AnimationTween.fromTop(c),
                child: Image.asset(
                  'assets/images/vvv.png',
                  fit: BoxFit.fill,
                  width: width,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: SlideTransition(
                position: AnimationTween.fromRight(c),
                child: Text(
                  '‫‪MY‬‬ ‫‪COMFORT‬‬ ‫‪PARTNER‬‬',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: AppStyleConfig.appColors['pink']),
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
