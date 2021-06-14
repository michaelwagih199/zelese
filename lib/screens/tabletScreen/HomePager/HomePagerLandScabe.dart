import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class HomePagerLandScabe extends StatefulWidget {
  const HomePagerLandScabe({Key key}) : super(key: key);

  @override
  _HomePagerLandScabeState createState() => _HomePagerLandScabeState();
}

class _HomePagerLandScabeState extends State<HomePagerLandScabe>
  with TickerProviderStateMixin {
  AnimationController c;

  var pageRes = <String, String>{
    'layer1': 'assets/images/tablet/home_page/homePagelayer1.png',
    'layer2': 'assets/images/tablet/home_page/l2.png',
    'layer3': 'assets/images/tablet/home_page/l3.png',
    'layer4': 'assets/images/tablet/home_page/homeVector.png',
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
            flex: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: Image.asset(
                      pageRes['layer1'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: SlideTransition(
                    position: AnimationTween.fromBottom(c),
                    child: Image.asset(
                      pageRes['layer4'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SlideTransition(
                    position: AnimationTween.fromLeft(c),
                    child: Image.asset(
                      pageRes['layer2'],
                      fit: BoxFit.contain,
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
