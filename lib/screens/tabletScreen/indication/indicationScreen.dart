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
  AnimationController c;

  @override
  void initState() {
    super.initState();
    c = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => {c.resync(this)});
  }

  var pageRes = <String, String>{
    'layer1': 'assets/images/indicatrionLandLayer1.png',
    'layer2': 'assets/images/indicatrionLandLayer2.png',
    'layer3': 'assets/images/indicatrionLandLayer3.png',
    'layer4': 'assets/images/indicatrionLandLayer4.png',
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Builder(
        builder: (context) => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    pageRes['layer1'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: SlideTransition(
                  position: AnimationTween.fromTop(c),
                  child: Image.asset(
                    pageRes['layer2'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Container(
              //     child: SlideTransition(
              //       position: AnimationTween.fromRight(c),
              //       child: Image.asset(
              //         pageRes['layer4'],
              //         fit: BoxFit.scaleDown,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
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
