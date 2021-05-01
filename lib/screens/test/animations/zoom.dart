import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ZoomAnimation extends StatefulWidget {
  @override
  _ZoomAnimationState createState() => _ZoomAnimationState();
}

class _ZoomAnimationState extends State<ZoomAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation heartbeatAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    heartbeatAnimation =
        Tween<double>(begin: 0.0, end: 200.0).animate(controller);
    controller.forward().whenComplete(() {
      // controller.reverse();

    });


    /* Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.of(context).pushReplacementNamed("/dashboard");
    });
*/
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: heartbeatAnimation,
      builder: (context, widget) {
        return Scaffold(
          body: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(),
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: heartbeatAnimation.value,
                ),
              ],
            ),

          ]),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

}
