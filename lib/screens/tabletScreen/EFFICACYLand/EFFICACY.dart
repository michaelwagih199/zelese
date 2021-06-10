import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class EFFICACYLandScabe extends StatefulWidget {
  EFFICACYLandScabe({Key key}) : super(key: key);

  @override
  _EFFICACYLandScabeState createState() => _EFFICACYLandScabeState();
}

class _EFFICACYLandScabeState extends State<EFFICACYLandScabe>
    with TickerProviderStateMixin {
  AnimationController c;

  @override
  void initState() {
    super.initState();

    c = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => {c.resync(this)});
  }

  @override
  Widget build(BuildContext context) {
    var pageRes = <String, String>{
      'layer1': 'assets/images/tablet/efficacy/layer1.png',
      'layer2': 'assets/images/tablet/efficacy/layer2.png',
      'layer3': 'assets/images/tablet/efficacy/layer3.png',
      'layer4': 'assets/images/tablet/efficacy/layer4.png',
      'layer5': 'assets/images/tablet/efficacy/layer5.png',
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
              Center(
                child: Container(
                  child: SlideTransition(
                    position: AnimationTween.fromTop(c),
                    child: Image.asset(
                      pageRes['layer1'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: Image.asset(
                    pageRes['layer2'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),

                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    pageRes['layer3'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: width,
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: Image.asset(
                    pageRes['layer4'],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),

                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    pageRes['layer5'],
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
  }
}
