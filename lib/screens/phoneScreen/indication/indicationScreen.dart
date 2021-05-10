import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class IndicationScreen extends StatefulWidget {
  IndicationScreen({Key key}) : super(key: key);

  @override
  _IndicationScreenState createState() => _IndicationScreenState();
}

class _IndicationScreenState extends State<IndicationScreen>
    with TickerProviderStateMixin {
  AnimationController _controller, c2, c3;
  Animation heartbeatAnimation;

  @override
  void initState() {
    super.initState();
    c2 = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => c3..forward());

    c3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    heartbeatAnimation = Tween<double>(begin: 0.0, end: 300.0).animate(c3);

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward().whenComplete(() => {});
  }

  var pageRes = <String, String>{
    'layer1': 'assets/images/indicationLasyer1.png',
    'layer2': 'assets/images/indicationLasyer2.png',
    'layer3': 'assets/images/indicationLasyer3.png',
    'layer4': 'assets/images/indicationLasyer4.png',
  };


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        width: width,
        margin: EdgeInsets.all(10),
        color: AppStyleConfig.appColors['backgrounLight'],
        child: Builder(
          builder: (context) => ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),

                    width: width,
                    child: SlideTransition(
                      position: AnimationTween.fromTop(_controller),
                      child: Image.asset(
                        pageRes['layer1'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),

                    width: width,
                    child: SlideTransition(
                      position: AnimationTween.fromLeft(c2),
                      child: Image.asset(
                        pageRes['layer2'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: width,
                    child: SlideTransition(
                      position: AnimationTween.fromBottom(c2),
                      child: Image.asset(
                        pageRes['layer3'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),

                    child: SlideTransition(
                      position: AnimationTween.fromLeft(c2),
                      child: Column(
                        children: [
                          Divider(
                            color: AppStyleConfig.appColors['pink'],
                          ),
                          Image.asset(pageRes['layer4'],
                              fit: BoxFit.scaleDown),
                        ],
                      ),
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
    _controller.dispose();
    c2.dispose();
    c3.dispose();
  }
}
