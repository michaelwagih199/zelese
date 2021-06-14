import 'package:flutter/material.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class UsageTipsPhonetic extends StatefulWidget {
  @override
  _UsageTipsPhoneticState createState() => _UsageTipsPhoneticState();
}

class _UsageTipsPhoneticState extends State<UsageTipsPhonetic>
    with TickerProviderStateMixin {
  AnimationController c;

  var pageRes = <String, String>{
    'layer1': 'assets/images/phone/usageTips/layer1.png',
    'layer2': 'assets/images/phone/usageTips/rowl1.png',
    'layer3': 'assets/images/phone/usageTips/rowl2.png',
    'layer4': 'assets/images/phone/usageTips/rowl3.png',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SlideTransition(
                      position: AnimationTween.fromTop(c),
                      child: Image.asset(
                        pageRes['layer2'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SlideTransition(
                      position: AnimationTween.fromTop(c),
                      child: Image.asset(
                        pageRes['layer3'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SlideTransition(
                      position: AnimationTween.fromTop(c),
                      child: Image.asset(
                        pageRes['layer4'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
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
