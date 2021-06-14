import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class IndicationScreen extends StatefulWidget {
  IndicationScreen({Key key}) : super(key: key);

  @override
  _IndicationScreenState createState() => _IndicationScreenState();
}

class _IndicationScreenState extends State<IndicationScreen>
    with TickerProviderStateMixin {

  AnimationController c;

  @override
  void initState() {
    super.initState();
    c = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => {c.resync(this)});
  }

  var pageRes = <String, String>{
    'layer1': 'assets/images/phone/indication/layer1.png',
    'layer2': 'assets/images/phone/indication/layer2.png',
    'layer3': 'assets/images/phone/indication/layer3.png',
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
  
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Builder(
        builder: (context) => ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: SlideTransition(
                    position: AnimationTween.fromTop(c),
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
                  margin: EdgeInsets.only(top: 25),
                  child: SlideTransition(
                    position: AnimationTween.fromBottom(c),
                    child: Image.asset(
                      pageRes['layer3'],
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
