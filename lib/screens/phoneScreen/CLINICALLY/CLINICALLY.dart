import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class CLINICALLY extends StatefulWidget {
  CLINICALLY({Key key}) : super(key: key);

  @override
  _CLINICALLYState createState() => _CLINICALLYState();
}

class _CLINICALLYState extends State<CLINICALLY> with TickerProviderStateMixin {
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
      'layer1': 'assets/images/phone/clinical/layer1.png',
      'layer2': 'assets/images/phone/clinical/layer2.png',
      'layer3': 'assets/images/phone/clinical/layer3.png',
      'layer4': 'assets/images/phone/clinical/layer4.png',
      'layer5': 'assets/images/phone/clinical/layer5.png',
      'layer6': 'assets/images/phone/clinical/layer6.png',
      'layer7': 'assets/images/phone/clinical/layer7.png',
    };

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Builder(
        builder: (context) => ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
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
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: Image.asset(
                      pageRes['layer6'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    c.dispose();
  }
}
