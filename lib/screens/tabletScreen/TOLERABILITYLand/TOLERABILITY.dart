import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class TOLERABILITYLandScab extends StatefulWidget {
  TOLERABILITYLandScab({Key key}) : super(key: key);
  @override
  _TOLERABILITYLandScabState createState() => _TOLERABILITYLandScabState();
}

class _TOLERABILITYLandScabState extends State<TOLERABILITYLandScab>
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
      'layer1': 'assets/images/tolarabilityLandLayer1.png',
      'layer2': 'assets/images/tolarabilityLandLayer2.png',
      'layer3': 'assets/images/tolarabilityLandLayer3.png',
      'layer4': 'assets/images/tolarabilityLandLayer4.png',
      'layer5': 'assets/images/tolarabilityLandLayer5.png',
    };

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Builder(
      builder: (context) => Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(30),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: Image.asset(
                      pageRes['layer1'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: SlideTransition(
                      position: AnimationTween.fromLeft(c),
                      child: Image.asset(
                        pageRes['layer2'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: SlideTransition(
                    position: AnimationTween.fromTop(c),
                    child: Image.asset(
                      pageRes['layer3'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: Image.asset(
                      pageRes['layer4'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: SlideTransition(
                    position: AnimationTween.fromBottom(c),
                    child: Column(
                      children: [
                        Image.asset(
                          pageRes['layer5'],
                          fit: BoxFit.scaleDown,
                        ),
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
    c.dispose();
    zoomC.dispose();
  }
}
