import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class CLINICALLYLandScabe extends StatefulWidget {
  CLINICALLYLandScabe({Key key}) : super(key: key);

  @override
  _CLINICALLYLandScabeState createState() => _CLINICALLYLandScabeState();
}

class _CLINICALLYLandScabeState extends State<CLINICALLYLandScabe> with TickerProviderStateMixin {
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
      'layer1': 'assets/images/clinacilityLandLayer1.png',
      'layer2': 'assets/images/clinacilityLandLayer2.png',
      'layer3': 'assets/images/clinacilityLandLayer3.png',
      'layer4': 'assets/images/clinacilityLandLayer4.png',
      'layer5': 'assets/images/clinacilityLandLayer5.png',
      'layer6': 'assets/images/clinacilityLandLayer6.png',
      'layer7': 'assets/images/clinacilityLandLayerm7.png',
    };

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(30),
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Builder(
        builder: (context) => ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width,
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: Image.asset(
                      pageRes['layer1'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SlideTransition(
                    position: AnimationTween.fromLeft(c),
                    child: Image.asset(
                      pageRes['layer2'],
                      fit: BoxFit.scaleDown,
                      width: width,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SlideTransition(
                    position: AnimationTween.fromTop(c),
                    child: Image.asset(
                      pageRes['layer3'],
                      fit: BoxFit.scaleDown,
                      width: width,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SlideTransition(
                    position: AnimationTween.fromLeft(c),
                    child: Image.asset(
                      pageRes['layer4'],
                      fit: BoxFit.scaleDown,
                      width: width,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SlideTransition(
                    position: AnimationTween.fromLeft(c),
                    child: Image.asset(
                      pageRes['layer5'],
                      fit: BoxFit.scaleDown,
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
                        Image.asset(
                          pageRes['layer6'],
                          fit: BoxFit.scaleDown,
                        ),
                      ],
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
                        Image.asset(
                          pageRes['layer7'],
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
