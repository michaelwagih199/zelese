import 'package:flutter/cupertino.dart';

class FractionallySizedWidget extends StatelessWidget {
  final double widthFactor;
  final Widget widget;
  final double heightFactor;

  FractionallySizedWidget(
      {@required this.widthFactor,
      @required this.widget,
      @required this.heightFactor});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FractionallySizedBox(
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: widget,
      ),
    );
  }
}
