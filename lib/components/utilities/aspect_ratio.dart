import 'package:flutter/cupertino.dart';

class AspectRatioWidget extends StatelessWidget {
 
  final double ratio;
  final Widget widget;

  AspectRatioWidget({@required this.ratio,@required this.widget});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ratio,
      child:widget
    );
  }
}