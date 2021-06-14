import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class HomePager extends StatefulWidget {
  const HomePager({Key key}) : super(key: key);
  @override
  _HomePagerState createState() => _HomePagerState();
}

class _HomePagerState extends State<HomePager> with TickerProviderStateMixin {

  AnimationController c;
  
  var pageRes = <String, String>{
    'layer1': 'assets/images/phone/homePhone/layer1.png',
    'layer2': 'assets/images/phone/homePhone/layer2.png',
    'layer3': 'assets/images/phone/homePhone/layer3.png',
    'layer4': 'assets/images/phone/homePhone/layer4.png',
  };

  @override
  void initState() {
    super.initState();
     c = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => { c.resync(this)});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: Image.asset(
                      pageRes['layer3'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),

                Flexible(
                  child: SlideTransition(
                    position: AnimationTween.fromLeft(c),
                    child: Image.asset(
                      pageRes['layer1'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: SlideTransition(
                position: AnimationTween.fromBottom(c),
                child: Image.asset(
                  pageRes['layer2'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: SlideTransition(
                position: AnimationTween.fromRight(c),
                child: Image.asset(
                  pageRes['layer4'],
                  fit: BoxFit.scaleDown,
                ),
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
