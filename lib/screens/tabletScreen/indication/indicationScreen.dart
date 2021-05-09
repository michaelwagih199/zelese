import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class IndicationLandScabeScreen extends StatefulWidget {
  IndicationLandScabeScreen({Key key}) : super(key: key);

  @override
  _IndicationLandScabeScreenState createState() =>
      _IndicationLandScabeScreenState();
}

class _IndicationLandScabeScreenState extends State<IndicationLandScabeScreen>
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
    'title': 'INDICATIONS',
    'subTtile':
        'An advanced formula developedby cosmetics and skin care experts',
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.fromLTRB(50, 100, 50, 100),
      minScale: 0.1,
      maxScale: 1.5,
      child: Container(
        width: width,
        color: AppStyleConfig.appColors['backgrounLight'],
        child: Builder(
          builder: (context) => ListView(
            children: [
              Container(
                width: width,
                margin: EdgeInsets.fromLTRB(10, 5, 5, 10),
                child: SlideTransition(
                  position: AnimationTween.fromTop(_controller),
                  child: SvgPicture.asset(
                    'assets/images/subTitleIndication.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: width,
                      child: SlideTransition(
                        position: AnimationTween.fromLeft(c2),
                        child: SvgPicture.asset(
                          'assets/images/indication.svg',
                          fit: BoxFit.scaleDown,
                        
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: width,
                      child: AnimatedBuilder(
                        animation: heartbeatAnimation,
                        builder: (context, widget) {
                          return Image.asset(
                            'assets/images/VULVOVAGINITIS.png',
                            fit: BoxFit.scaleDown,
                            width: heartbeatAnimation.value,
                            height: heartbeatAnimation.value,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

               Container(
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c2),
                  child: Column(
                    children: [
                      Divider(
                        color: AppStyleConfig.appColors['pink'],
                      ),
                      SvgPicture.asset('assets/images/r1.svg',
                          fit: BoxFit.scaleDown),
                    ],
                  ),
                ),
              ),

            ],
          ),
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
