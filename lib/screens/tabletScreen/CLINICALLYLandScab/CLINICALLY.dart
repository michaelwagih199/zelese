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

class _CLINICALLYLandScabeState extends State<CLINICALLYLandScabe>
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
      'layer1': 'assets/images/tablet/clinicality/layer1.png',
      'layer2': 'assets/images/tablet/clinicality/layer2.png',
      'layer3': 'assets/images/tablet/clinicality/layer3.png',
      'layer4': 'assets/images/tablet/clinicality/layer4.png',
      'layer5': 'assets/images/tablet/clinicality/layer5.png',
      'layer6': 'assets/images/tablet/clinicality/layer6.png',
      'layer7': 'assets/images/tablet/clinicality/layer7.png',
    };

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Builder(
      builder: (context) => ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                margin: EdgeInsets.only(top: 15),
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    pageRes['layer2'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SlideTransition(
                  position: AnimationTween.fromTop(c),
                  child: Image.asset(
                    pageRes['layer3'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    pageRes['layer4'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    pageRes['layer5'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SlideTransition(
                  position: AnimationTween.fromBottom(c),
                  child: Image.asset(
                    pageRes['layer6'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SlideTransition(
                  position: AnimationTween.fromBottom(c),
                  child: Image.asset(
                    pageRes['layer7'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ],
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
