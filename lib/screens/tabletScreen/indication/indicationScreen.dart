import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class IndicationLandScabeScreen extends StatefulWidget {
  IndicationLandScabeScreen({Key key}) : super(key: key);

  @override
  _IndicationLandScabeScreenState createState() =>
      _IndicationLandScabeScreenState();
}

class _IndicationLandScabeScreenState extends State<IndicationLandScabeScreen>
    with TickerProviderStateMixin {
  AnimationController _controller, c2, c3;
  Animation heartbeatAnimation;

  @override
  void initState() {
    super.initState();
    c2 = AnimationController(duration: const Duration(seconds: 2), vsync: this)
      ..forward().whenComplete(() => c3..forward());

    c3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    heartbeatAnimation = Tween<double>(begin: 0.0, end: 300.0).animate(c3);

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward().whenComplete(() => {});
  }

  var pageRes = <String, String>{
    'layer1': 'assets/images/indicatrionLandLayer1.png',
    'layer2': 'assets/images/indicatrionLandLayer2.png',
    'layer3': 'assets/images/indicatrionLandLayer3.png',
    'layer4': 'assets/images/indicatrionLandLayer4.png',
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(40),
      width: width,
      height: height,
      color: AppStyleConfig.appColors['backgrounLight'],
      child: Builder(
        builder: (context) => ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: SlideTransition(
                    position: AnimationTween.fromTop(_controller),
                    child: Image.asset(
                      pageRes['layer1'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: SlideTransition(
                    position: AnimationTween.fromTop(_controller),
                    child: Image.asset(
                      pageRes['layer2'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 0),

                  child: SlideTransition(
                    position: AnimationTween.fromTop(_controller),
                    child: Image.asset(
                      pageRes['layer3'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  child: SlideTransition(
                    position: AnimationTween.fromBottom(_controller),
                    child: Image.asset(
                      pageRes['layer4'],
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
    _controller.dispose();
    c2.dispose();
    c3.dispose();
  }
}
