import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class TheDiscomfort extends StatefulWidget {
  @override
  _TheDiscomfortState createState() => _TheDiscomfortState();
}

class _TheDiscomfortState extends State<TheDiscomfort>
    with TickerProviderStateMixin {

  AnimationController c;

  var pageRes = <String, String>{
    'layer1': 'assets/images/tablet/discomfort/layer1.png',
    'layer2': 'assets/images/tablet/discomfort/layer2.png',
    'layer3': 'assets/images/tablet/discomfort/layer3.png',
    'layer4': 'assets/images/tablet/discomfort/layer4.png',
    'layer5': 'assets/images/tablet/discomfort/layer5.png',
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
      margin: EdgeInsets.all(10),
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Column(
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

          Container(
            child: SlideTransition(
              position: AnimationTween.fromRight(c),
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
              position: AnimationTween.fromRight(c),
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
