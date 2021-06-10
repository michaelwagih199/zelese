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
      'layer1': 'assets/images/tablet/tolarability/layer1.png',
      'layer2': 'assets/images/tablet/tolarability/layer2.png',
      'layer3': 'assets/images/tablet/tolarability/layer3.png',
      'layer4': 'assets/images/tablet/tolarability/layer4.png',
      'layer5': 'assets/images/tablet/tolarability/layer5.png',
    };

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Builder(
        builder: (context) =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
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
                  child: SlideTransition(
                    position: AnimationTween.fromTop(c),
                    child: Image.asset(
                      pageRes['layer3'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Container(
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: Image.asset(
                      pageRes['layer4'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: SlideTransition(
                      position: AnimationTween.fromRight(c),
                      child: Image.asset(
                        pageRes['layer5'],
                        fit: BoxFit.scaleDown,
                      ),
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
    zoomC.dispose();
  }
}
