import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class TOLERABILITY extends StatefulWidget {
  TOLERABILITY({Key key}) : super(key: key);
  @override
  _TOLERABILITYState createState() => _TOLERABILITYState();
}

class _TOLERABILITYState extends State<TOLERABILITY> with TickerProviderStateMixin {
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
      'layer1': 'assets/images/TOLERABILITYLayer1.svg',
      'layer2': 'assets/images/TOLERABILITYLayer2.jpg',
      'layer3': 'assets/images/TOLERABILITYLayer3.png',
      'layer4': 'assets/images/TOLERABILITYLayer4.svg',
      'layer5': 'assets/images/TOLERABILITYLayer5.svg',
    };

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.fromLTRB(50, 100, 50, 100),
      minScale: 0.1,
      maxScale: 1.5,
      child: Container(
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
                  position: AnimationTween.fromRight(c),
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
                  position: AnimationTween.fromLeft(c),
                  child: Image.asset(
                    pageRes['layer2'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SlideTransition(
                  position: AnimationTween.fromTop(c),
                  child: Image.asset(
                    pageRes['layer3'],
                    fit: BoxFit.fill,
                    width: width,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SlideTransition(
                  position: AnimationTween.fromLeft(c),
                  child: SvgPicture.asset(
                    pageRes['layer4'],
                    fit: BoxFit.contain,
                    width: width,
                  ),
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
                        pageRes['layer5'],
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
