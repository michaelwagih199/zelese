import 'package:flutter/material.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class TheDiscomfortPhones extends StatefulWidget {
  @override
  _TheDiscomfortPhonesState createState() => _TheDiscomfortPhonesState();
}

class _TheDiscomfortPhonesState extends State<TheDiscomfortPhones>
    with TickerProviderStateMixin {
  AnimationController c;

  var pageRes = <String, String>{
    'layer1': 'assets/images/phone/theDiscomfort/layer1.png',
    'layer2': 'assets/images/phone/theDiscomfort/layer2.png',
    'layer3': 'assets/images/phone/theDiscomfort/layer3.png',
    'layer4': 'assets/images/phone/theDiscomfort/layer4.png',
    'layer5': 'assets/images/phone/theDiscomfort/layer5.png',
    'layer6': 'assets/images/phone/theDiscomfort/layer6.png',
  };

  @override
  void initState() {
    super.initState();
    c = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => {c.resync(this)});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: SlideTransition(
              position: AnimationTween.fromTop(c),
              child: Image.asset(
                pageRes['layer1'],
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Container(
            child: SlideTransition(
              position: AnimationTween.fromLeft(c),
              child: Image.asset(
                pageRes['layer2'],
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Container(
            child: SlideTransition(
              position: AnimationTween.fromRight(c),
              child: Image.asset(
                pageRes['layer3'],
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Container(
            child: SlideTransition(
              position: AnimationTween.fromLeft(c),
              child: Image.asset(
                pageRes['layer4'],
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Container(
            child: SlideTransition(
              position: AnimationTween.fromRight(c),
              child: Image.asset(
                pageRes['layer5'],
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            child: SlideTransition(
              position: AnimationTween.fromBottom(c),
              child: Image.asset(
                pageRes['layer6'],
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    c.dispose();
  }
}
