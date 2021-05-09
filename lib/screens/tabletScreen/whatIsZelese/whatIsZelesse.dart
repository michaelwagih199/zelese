import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class WhatIsZelesseLandScabe extends StatefulWidget {
  WhatIsZelesseLandScabe({Key key}) : super(key: key);
  @override
  _WhatIsZelesseLandScabeState createState() => _WhatIsZelesseLandScabeState();
}

class _WhatIsZelesseLandScabeState extends State<WhatIsZelesseLandScabe>
    with TickerProviderStateMixin {
  AnimationController c, zoomC;
  Animation zoomInAnimate;

  @override
  void initState() {
    super.initState();
    zoomC = AnimationController(vsync: this, duration: Duration(seconds: 1));
    zoomInAnimate = Tween<double>(begin: 0.0, end: 300.0).animate(zoomC);
    c = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => {zoomC..forward(), c.resync(this)});
  }

  @override
  Widget build(BuildContext context) {
    var pageRes = <String, String>{
      'layer1': 'assets/images/whatZeless.svg',
      'layer2': 'assets/images/whatzLayesr2.svg',
      'layer3': 'assets/images/whatzLayesr3.svg',
      'layer4': 'assets/images/whatzLayesr4.svg',
      'layer5': 'assets/images/whatzLayesr5.png',
      'layer6': 'assets/images/whatzLayesr6.svg',
      'layer7': 'assets/images/whatzLayesr7.svg',
    };

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(15),
        color: AppStyleConfig.appColors['backgrounLight'],
        child: Builder(
          builder: (context) => ListView(
            children: [
              Container(
                child: SlideTransition(
                  position: AnimationTween.fromTop(c),
                  child: SvgPicture.asset(
                    pageRes['layer1'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: SlideTransition(
                            position: AnimationTween.fromRight(c),
                            child: SvgPicture.asset(
                              pageRes['layer2'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                           margin: EdgeInsets.only(top: 20),
                          child: SlideTransition(
                            position: AnimationTween.fromRight(c),
                            child: SvgPicture.asset(
                              pageRes['layer4'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                           margin: EdgeInsets.only(top: 20),
                          child: SlideTransition(
                            position: AnimationTween.fromRight(c),
                            child: SvgPicture.asset(
                              pageRes['layer6'],
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                           margin: EdgeInsets.only(top: 20),
                          child: SlideTransition(
                            position: AnimationTween.fromLeft(c),
                            child: SvgPicture.asset(
                              pageRes['layer3'],
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Container(
                           margin: EdgeInsets.only(top: 20),
                          child: SlideTransition(
                            position: AnimationTween.fromRight(c),
                            child: Image.asset(
                              pageRes['layer5'],
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: SlideTransition(
                  position: AnimationTween.fromBottom(c),
                  child: Column(
                    children: [
                      Divider(
                        color: AppStyleConfig.appColors['pink'],
                      ),
                      SvgPicture.asset(
                        pageRes['layer7'],
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
