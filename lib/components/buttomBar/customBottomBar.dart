import 'package:flutter/cupertino.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            height: 50,
            color: AppStyleConfig.appColors['bottomBar'],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}
