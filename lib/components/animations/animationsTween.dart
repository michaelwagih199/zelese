import 'package:flutter/cupertino.dart';

class AnimationTween {
  static Animation<Offset> fromLeft(AnimationController _controller) {
    return Tween<Offset>(
      begin: const Offset(-10, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic,
      ),
    );
  }

  static Animation<Offset> fromTop(AnimationController _controller) {
    return Tween<Offset>(
      begin: const Offset(0.0, -10),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic,
      ),
    );
  }

  static Animation<Offset> fromRight(AnimationController _controller) {
    return Tween<Offset>(
      begin: const Offset(10, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic,
      ),
    );
  }

  static Animation<Offset> fromBottom(AnimationController _controller) {
    return Tween<Offset>(
      begin: const Offset(0.0, 10),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic,
      ),
    );
  }
}
