import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class WhatIsZelesse extends StatefulWidget {
  WhatIsZelesse({Key key}) : super(key: key);
  @override
  _WhatIsZelesseState createState() => _WhatIsZelesseState();
}

class _WhatIsZelesseState extends State<WhatIsZelesse>
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

    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.fromLTRB(50, 100, 50, 100),
      minScale: 0.1,
      maxScale: 1.5,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(15),
        color: AppStyleConfig.appColors['backgrounLight'],
        child: Builder(
          builder: (context) => ListView(
            children: [
              Container(
                width: width,
                child: SlideTransition(
                  position: AnimationTween.fromTop(c),
                  child: SvgPicture.asset(
                    pageRes['layer1'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: SvgPicture.asset(
                    pageRes['layer2'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: SvgPicture.asset(
                    pageRes['layer3'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: SvgPicture.asset(
                    pageRes['layer4'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: AnimatedBuilder(
                  animation: zoomInAnimate,
                  builder: (context, widget) {
                    return Image.asset(
                      pageRes['layer5'],
                      fit: BoxFit.scaleDown,
                      width: zoomInAnimate.value,
                      height: zoomInAnimate.value,
                    );
                  },
                ),
              ),
              Container(
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: SvgPicture.asset(
                    pageRes['layer6'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
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
      ),
    );
  }
}
