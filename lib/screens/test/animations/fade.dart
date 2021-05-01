
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class AnimatedCrossFadeExample extends StatefulWidget {
  @override
  _AnimatedCrossFadeExampleState createState() =>
      new _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(-10, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Woolha.com Flutter Tutorial'),
      ),
      body: Builder(
          builder: (context) => Center(
            child: SlideTransition(
              position: _animation,
              transformHitTests: true,
              textDirection: TextDirection.ltr,
              child: RaisedButton(
                child: Text('Woolha.com'),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Button is pressed'))
                  );
                },
              ),
            ),
          )
      ),
    );
  }
}