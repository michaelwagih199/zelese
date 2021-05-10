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
  AnimationController c, zoomC;
  Animation zoomInAnimate;

  var pageRes = <String, String>{
    'layer1': 'assets/images/homePagelayer1.svg',
    'layer2': 'assets/images/homePagelayer2.png',
    'layer3': 'assets/images/homePagelayer3.png',
    'layer4': 'assets/images/homeVector.png',
  };

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(10),
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: SvgPicture.asset(
                      pageRes['layer1'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),

                Expanded(
                  child: SlideTransition(
                    position: AnimationTween.fromLeft(c),
                    child: Image.asset(
                      pageRes['layer2'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: SlideTransition(
                position: AnimationTween.fromBottom(c),
                child: Image.asset(
                  pageRes['layer4'],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: SlideTransition(
                position: AnimationTween.fromRight(c),
                child: Image.asset(
                  pageRes['layer3'],
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
