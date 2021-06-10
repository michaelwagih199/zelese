import 'package:flutter/material.dart';
import 'package:zelese/components/animations/animationsTween.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class UsageTips extends StatefulWidget {
  @override
  _UsageTipsState createState() => _UsageTipsState();
}

class _UsageTipsState extends State<UsageTips> with TickerProviderStateMixin {
  AnimationController c;

  var pageRes = <String, String>{
    'layer1': 'assets/images/tablet/usageTips/left.png',
    'layer2': 'assets/images/tablet/usageTips/mdown.png',
    'layer3': 'assets/images/tablet/usageTips/mup.png',
    'layer4': 'assets/images/tablet/usageTips/right.png',
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
          children: [
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: SlideTransition(
                        position: AnimationTween.fromRight(c),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Container(
                                  child: SlideTransition(
                                    position: AnimationTween.fromBottom(c),
                                    child: Image.asset(
                                      pageRes['layer3'],
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  child: SlideTransition(
                                    position: AnimationTween.fromLeft(c),
                                    child: Image.asset(
                                      pageRes['layer2'],
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
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
                  ),
                ],
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
