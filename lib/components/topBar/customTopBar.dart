import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zelese/components/utilities/appBarButton.dart';
import 'package:zelese/components/utilities/vertivalDevider.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class CustomTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: AppStyleConfig.appColors['primary'],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      height: AppStyleConfig.appDimensions['AppTopBarHeight'],
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Image.asset('assets/images/logo.png',
                width: 100, height: 70, fit: BoxFit.scaleDown),
          ),
          CustomVerticalDevider(),
          CustomAppBarButton('INDICATIONS', 14, '', () {}),
          CustomVerticalDevider(),
          CustomAppBarButton('EFFICACY', 14, '', () {}),
          CustomVerticalDevider(),
          CustomAppBarButton('TOLERABILITY', 14, '', () {}),
          CustomVerticalDevider(),
          CustomAppBarButton('CLINICALLY PROVEN EFFICACY', 14, '', () {}),
        ],
      ),
    );
  }
}
