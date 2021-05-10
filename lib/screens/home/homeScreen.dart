import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zelese/components/utilities/appBarButton.dart';
import 'package:zelese/components/utilities/vertivalDevider.dart';
import 'package:zelese/screens/phoneScreen/CLINICALLY/CLINICALLY.dart';
import 'package:zelese/screens/phoneScreen/EFFICACY/EFFICACY.dart';
import 'package:zelese/screens/phoneScreen/TOLERABILITY/TOLERABILITY.dart';
import 'package:zelese/screens/phoneScreen/homeViewer/homePager.dart';
import 'package:zelese/screens/phoneScreen/indication/indicationScreen.dart';
import 'package:zelese/screens/phoneScreen/whatIsZelese/whatIsZelesse.dart';
import 'package:zelese/screens/tabletScreen/CLINICALLYLandScab/CLINICALLY.dart';
import 'package:zelese/screens/tabletScreen/EFFICACYLand/EFFICACY.dart';
import 'package:zelese/screens/tabletScreen/HomePager/HomePagerLandScabe.dart';
import 'package:zelese/screens/tabletScreen/TOLERABILITYLand/TOLERABILITY.dart';
import 'package:zelese/screens/tabletScreen/indication/indicationScreen.dart';
import 'package:zelese/screens/tabletScreen/whatIsZelese/whatIsZelesse.dart';

import 'package:zelese/theme/appStyleConfig.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int curr = 0;
  bool _isDrawableVisible = false;
  bool _isMenuVisable = false;

  void showDrawer() {
    setState(() {
      _isDrawableVisible = !_isDrawableVisible;
    });
  }

  void showMenu() {
    setState(() {
      _isMenuVisable = !_isMenuVisable;
    });
  }

  Color zeleseColor;
  Color indicationColor;
  Color efficacyColor;
  Color tolarabilityColor;
  Color CLINICALLYColor;

  resetColors() {
    setState(() {
      zeleseColor = AppStyleConfig.appColors['primary'];
      indicationColor = AppStyleConfig.appColors['primary'];
      efficacyColor = AppStyleConfig.appColors['primary'];
      tolarabilityColor = AppStyleConfig.appColors['primary'];
      CLINICALLYColor = AppStyleConfig.appColors['primary'];
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var drawers = <String, String>{
      'drawer1': 'assets/images/drawer1.png',
      'drawer2': 'assets/images/drawer2.png',
      'drawer3': 'assets/images/drawer3.png',
      'drawer4': 'assets/images/drawer4.png',
      'drawer5': 'assets/images/drawer5.png',
      'drawerNew': 'assets/images/drawerNew.png',
    };

    List<Widget> _list = <Widget>[
      new HomePager(),
      new WhatIsZelesse(),
      new IndicationScreen(),
      new EFFICACY(),
      new CLINICALLY(),
      new TOLERABILITY(),
    ];

    List<Widget> _listLandScape = <Widget>[
      new HomePagerLandScabe(),
      new WhatIsZelesseLandScabe(),
      new IndicationLandScabeScreen(),
      new EFFICACYLandScabe(),
      new CLINICALLYLandScabe(),
      new TOLERABILITYLandScab(),
    ];

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (builder, constraints) {
            if (width < 600) {
              return phoneColumn(_list, drawers);
            } else {
              return tabletColumn(_listLandScape, drawers);
            }
          },
        ),
      ),
    );
  }

  Column phoneColumn(List<Widget> _list, Map<String, String> drawers) {
    return Column(
      children: [
        //top bar
        Expanded(
          flex: 1,
          child: Container(
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
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: IconButton(
                        icon: Icon(Icons.menu,
                            color: AppStyleConfig.appColors['lima']),
                        onPressed: showMenu),
                  ),
                  Container(
                    child: Image.asset('assets/images/logo.png',
                        width: 100, height: 70, fit: BoxFit.scaleDown),
                  ),
                ],
              ),
            ),
          ),
        ),

        Expanded(
          flex: 12,
          child: Container(
            child: Stack(
              children: [
                PageView(
                  children: _list,
                  scrollDirection: Axis.horizontal,
                  // reverse: true,
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (num) {
                    setState(() {
                      curr = num;
                    });
                  },
                ),
                alignDrawer(drawers),
                Align(
                  alignment: Alignment.topLeft,
                  child: Visibility(
                    visible: _isMenuVisable,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: myBoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomAppBarButton(
                              'ZELESSE', 20, 'MinionPro', Colors.white, null,
                              () {
                            setState(() {
                              pageController.jumpToPage(1);
                              _isMenuVisable = false;
                            });
                          }),
                          Divider(
                            color: Colors.white,
                          ),
                          CustomAppBarButton('INDICATIONS', 20, 'MinionPro',
                              Colors.white, null, () {
                            setState(() {
                              pageController.jumpToPage(2);
                              _isMenuVisable = false;
                            });
                          }),
                          Divider(
                            color: Colors.white,
                          ),
                          CustomAppBarButton(
                              'EFFICACY', 20, 'MinionPro', Colors.white, null,
                              () {
                            setState(() {
                              pageController.jumpToPage(3);
                              _isMenuVisable = false;
                            });
                          }),
                          Divider(
                            color: Colors.white,
                          ),
                          CustomAppBarButton('CLINICALLY EFFICACY', 20,
                              'MinionPro', Colors.white, null, () {
                            setState(() {
                              pageController.jumpToPage(4);
                              _isMenuVisable = false;
                            });
                          }),
                          Divider(
                            color: Colors.white,
                          ),
                          CustomAppBarButton('TOLERABILITY', 20, 'MinionPro',
                              Colors.white, null, () {
                            setState(() {
                              pageController.jumpToPage(5);
                              _isMenuVisable = false;
                            });
                          }),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //bottomBar
        bottomBar(),
      ],
    );
  }

  Align alignDrawer(Map<String, String> drawers) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Visibility(
        visible: _isDrawableVisible,
        child: Container(
          decoration: myBoxDecoration(),
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.jumpToPage(0);
                    _isDrawableVisible = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(drawers['drawerNew'], fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.jumpToPage(1);
                    _isDrawableVisible = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(drawers['drawer2'], fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.jumpToPage(2);
                    _isDrawableVisible = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(drawers['drawer1'], fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.jumpToPage(3);
                    _isDrawableVisible = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(drawers['drawer3'], fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.jumpToPage(4);
                    _isDrawableVisible = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(drawers['drawer5'], fit: BoxFit.cover),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController.jumpToPage(5);
                    _isDrawableVisible = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(drawers['drawer4'], fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column tabletColumn(
      List<Widget> _listLandScape, Map<String, String> drawers) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
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
            height: 60,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.jumpTo(0);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Image.asset('assets/images/logo.png',
                          width: 100, height: 70, fit: BoxFit.scaleDown),
                    ),
                  ),
                  CustomVerticalDevider(),
                  CustomAppBarButton(
                      'ZELESSE',
                      20,
                      '',
                      AppStyleConfig.appColors['lima'],
                      ZELESSEDecoration(), () {
                    pageController.jumpToPage(1);
                    resetColors();
                    zeleseColor = AppStyleConfig.appColors['orgwany'];
                  }),
                  CustomVerticalDevider(),
                  CustomAppBarButton(
                      'INDICATIONS',
                      20,
                      '',
                      AppStyleConfig.appColors['lima'],
                      INDICATIONSDecoration(), () {
                    pageController.jumpToPage(2);
                    resetColors();
                    indicationColor = AppStyleConfig.appColors['orgwany'];
                  }),
                  CustomVerticalDevider(),
                  CustomAppBarButton(
                      'EFFICACY',
                      20,
                      '',
                      AppStyleConfig.appColors['lima'],
                      EFFICACYDecoration(), () {
                    pageController.jumpToPage(3);

                    resetColors();
                    efficacyColor = AppStyleConfig.appColors['orgwany'];
                  }),
                  CustomVerticalDevider(),
                  CustomAppBarButton(
                      'CLINICALLY EFFICACY',
                      20,
                      '',
                      AppStyleConfig.appColors['lima'],
                      CLINICALLYDecoration(), () {
                    pageController.jumpToPage(4);

                    resetColors();
                    CLINICALLYColor = AppStyleConfig.appColors['orgwany'];
                  }),
                  CustomVerticalDevider(),
                  CustomAppBarButton(
                      'TOLERABILITY',
                      20,
                      '',
                      AppStyleConfig.appColors['lima'],
                      TOLERABILITYDecoration(), () {
                    pageController.jumpToPage(5);

                    resetColors();
                    tolarabilityColor = AppStyleConfig.appColors['orgwany'];
                  }),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: Stack(children: [
              PageView(
                children: _listLandScape,
                scrollDirection: Axis.horizontal,
                // reverse: true,
                physics: BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (num) {

                  setState(() {

                    curr = num;
                    switch (num) {
                      case 1:
                        {
                          resetColors();
                          zeleseColor = AppStyleConfig.appColors['orgwany'];
                        }
                        break;
                      case 2:
                        {
                          resetColors();
                          indicationColor = AppStyleConfig.appColors['orgwany'];
                        }
                        break;
                      case 3:
                        {
                          resetColors();
                          efficacyColor = AppStyleConfig.appColors['orgwany'];
                        }
                        break;
                      case 4:
                        {
                          resetColors();
                          CLINICALLYColor = AppStyleConfig.appColors['orgwany'];
                        }
                        break;
                      case 5:
                        {
                          resetColors();
                          tolarabilityColor = AppStyleConfig.appColors['orgwany'];
                        }
                        break;

                      default:
                        {
                          resetColors();
                        }
                        break;
                    }

                  });
                },
              ),
            ]),
          ),
        ),
        alignDrawer(drawers),
        bottomBar(),
      ],
    );
  }

  Expanded bottomBar() {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
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
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/arrowBack.png'),
                    onPressed: previousPage,
                  ),
                  IconButton(
                      icon: Image.asset('assets/images/homeIcon.png'),
                      onPressed: () {
                        pageController.jumpToPage(0);
                      }),
                  IconButton(
                    icon: Image.asset('assets/images/dashBoeardIcon.png'),
                    onPressed: showDrawer,
                  ),
                  IconButton(
                      icon: Image.asset('assets/images/nextArrowIcon.png'),
                      onPressed: nextPage),
                ],
              ),
              Container(
                child: Image.asset('assets/images/companyLogo.png',
                    width: 100, height: 70, fit: BoxFit.scaleDown),
              )
            ],
          ),
        ),
      ),
    );
  }

  void nextPage() {
    pageController.animateToPage(pageController.page.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeInExpo);
  }

  void previousPage() {
    pageController.animateToPage(pageController.page.toInt() - 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeInExpo);
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: AppStyleConfig.appColors['orgwany'].withOpacity(0.8),
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    );
  }

  BoxDecoration ZELESSEDecoration() {
    return BoxDecoration(
      color: zeleseColor,
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    );
  }

  BoxDecoration TOLERABILITYDecoration() {
    return BoxDecoration(
      color: tolarabilityColor,
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    );
  }

  BoxDecoration CLINICALLYDecoration() {
    return BoxDecoration(
      color: CLINICALLYColor,
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    );
  }

  BoxDecoration EFFICACYDecoration() {
    return BoxDecoration(
      color: efficacyColor,
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    );
  }

  BoxDecoration INDICATIONSDecoration() {
    return BoxDecoration(
      color: indicationColor,
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    );
  }
}
