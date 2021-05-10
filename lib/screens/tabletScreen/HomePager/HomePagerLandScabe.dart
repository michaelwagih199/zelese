import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class HomePagerLandScabe extends StatefulWidget {
  const HomePagerLandScabe({Key key}) : super(key: key);

  @override
  _HomePagerLandScabeState createState() => _HomePagerLandScabeState();
}

class _HomePagerLandScabeState extends State<HomePagerLandScabe> with TickerProviderStateMixin {
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
                  flex: 1,
                  child: SlideTransition(
                    position: AnimationTween.fromRight(c),
                    child: SvgPicture.asset(
                      pageRes['layer1'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Container(
                    child: SlideTransition(
                      position: AnimationTween.fromBottom(c),
                      child: Image.asset(
                        pageRes['layer4'],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
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
           Container(
              child: SlideTransition(
                position: AnimationTween.fromRight(c),
                child: Image.asset(
                  pageRes['layer3'],
                  fit: BoxFit.fill,
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
