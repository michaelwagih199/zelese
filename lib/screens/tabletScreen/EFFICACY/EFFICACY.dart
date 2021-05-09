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

class _EFFICACYLandScabeState extends State<EFFICACYLandScabe> with TickerProviderStateMixin {
  AnimationController c, zoomC;
  Animation zoomInAnimate;

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
    var pageRes = <String, String>{
      'layer1': 'assets/images/EFFICACYLayer1.svg',
      'layer2': 'assets/images/EFFICACYLayer2.svg',
      'layer3': 'assets/images/EFFICACYLayer3.svg',
      'layer4': 'assets/images/EFFICACYLayer4.png',
      'layer5': 'assets/images/EFFICACYLayer5.svg',
      'layer6': 'assets/images/EFFICACYLayer6.svg',
    };

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return  Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(15),
        color: AppStyleConfig.appColors['backgrounLight'],
        child: Builder(
          builder: (context) => ListView(
            children: [
              Container(
                width: width,
                child: SlideTransition(
                  position: AnimationTween.fromTop(c),
                  child: SvgPicture.asset(
                    pageRes['layer1'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: SvgPicture.asset(
                    pageRes['layer2'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: SvgPicture.asset(
                    pageRes['layer3'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SlideTransition(
                  position: AnimationTween.fromRight(c),
                  child: Image.asset(
                    pageRes['layer4'],
                    fit: BoxFit.contain,
                    width: width,
                  ),
                ),
              ),
              Container(
                child: AnimatedBuilder(
                  animation: zoomInAnimate,
                  builder: (context, widget) {
                    return SvgPicture.asset(
                      pageRes['layer5'],
                      fit: BoxFit.contain,
                      width: zoomInAnimate.value,
                      height: zoomInAnimate.value,
                    );
                  },
                ),
              ),
              Container(
                child: SlideTransition(
                  position: AnimationTween.fromBottom(c),
                  child: Column(
                    children: [
                      Divider(
                        color: AppStyleConfig.appColors['pink'],
                      ),
                      SvgPicture.asset(
                        pageRes['layer6'],
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
