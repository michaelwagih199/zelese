import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zelese/components/utilities/appBarButton.dart';
import 'package:zelese/components/utilities/vertivalDevider.dart';
import 'package:zelese/screens/phoneScreen/CLINICALLY/CLINICALLY.dart';
import 'package:zelese/screens/phoneScreen/EFFICACY/EFFICACY.dart';
import 'package:zelese/screens/phoneScreen/TOLERABILITY/TOLERABILITY.dart';
import 'package:zelese/screens/phoneScreen/indication/indicationScreen.dart';
import 'package:zelese/screens/phoneScreen/whatIsZelese/whatIsZelesse.dart';
import 'package:zelese/screens/tabletScreen/EFFICACY/EFFICACY.dart';
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
    };

    List<Widget> _list = <Widget>[
      new IndicationScreen(),
      new WhatIsZelesse(),
      new EFFICACY(),
      new TOLERABILITY(),
      new CLINICALLY(),
    ];

    List<Widget> _listLandScape = <Widget>[
      new IndicationLandScabeScreen(),
      new WhatIsZelesseLandScabe(),
      new EFFICACYLandScabe(),
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
                        icon: Icon(Icons.menu, color: Colors.pinkAccent),
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
                      width: 120,
                      margin: EdgeInsets.all(10),
                      decoration: myBoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomAppBarButton('INDICATIONS', 12, 'MinionPro',
                              Colors.white, myBoxDecoration(), () {
                            setState(() {
                              pageController.jumpToPage(0);
                              _isMenuVisable = false;
                            });
                          }),
                          Divider(
                            color: AppStyleConfig.appColors['pink'],
                          ),
                          CustomAppBarButton('WHAT IS ZELESSE', 12, 'MinionPro',
                              Colors.white, drawerDecoration(), () {
                            setState(() {
                              pageController.jumpToPage(1);
                              _isMenuVisable = false;
                            });
                          }),
                          Divider(
                            color: AppStyleConfig.appColors['pink'],
                          ),
                          CustomAppBarButton('EFFICACY', 12, 'MinionPro',
                              Colors.white, drawerDecoration(), () {
                            setState(() {
                              pageController.jumpToPage(2);
                              _isMenuVisable = false;
                            });
                          }),
                          Divider(
                            color: AppStyleConfig.appColors['pink'],
                          ),
                          CustomAppBarButton('TOLERABILITY', 12, 'MinionPro',
                              Colors.white, drawerDecoration(), () {
                            setState(() {
                              pageController.jumpToPage(3);
                              _isMenuVisable = false;
                            });
                          }),
                          Divider(
                            color: AppStyleConfig.appColors['pink'],
                          ),
                          CustomAppBarButton(
                              'CLINICALLY PROVEN EFFICACY',
                              12,
                              'MinionPro',
                              Colors.white,
                              drawerDecoration(), () {
                            setState(() {
                              pageController.jumpToPage(4);
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
                  child: Image.asset(drawers['drawer1'], fit: BoxFit.cover),
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
                  child: Image.asset(drawers['drawer3'], fit: BoxFit.cover),
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
                  child: Image.asset(drawers['drawer4'], fit: BoxFit.cover),
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
            ],
          ),
        ),
      ),
    );
  }

  Column tabletColumn(List<Widget> _listLandScape, Map<String, String> drawers) {
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
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Image.asset('assets/images/logo.png',
                        width: 100, height: 70, fit: BoxFit.scaleDown),
                  ),
                  CustomVerticalDevider(),
                  CustomAppBarButton(
                      'INDICATIONS', 12, '', Colors.white, drawerDecoration(),
                      () {
                    setState(() {});
                  }),
                  CustomVerticalDevider(),
                  CustomAppBarButton(
                      'EFFICACY', 12, '', Colors.white, drawerDecoration(), () {
                    setState(() {});
                  }),
                  CustomVerticalDevider(),
                  CustomAppBarButton(
                      'TOLERABILITY', 12, '', Colors.white, drawerDecoration(),
                      () {
                    setState(() {});
                  }),
                  CustomVerticalDevider(),
                  CustomAppBarButton('PROVEN EFFICACY', 12, '', Colors.white,
                      drawerDecoration(), () {
                    setState(() {});
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
                  });
                },
              ),
            ]),
          ),
        ),
        bottomBar(),
      ],
    );
  }

  Expanded bottomBar() {
    return Expanded(
      flex: 1,
      child: Container(
        color: AppStyleConfig.appColors['bottomBar'],
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.pinkAccent),
                    onPressed: previousPage,
                  ),
                  IconButton(
                      icon: Icon(Icons.home_filled, color: Colors.pinkAccent),
                      onPressed: () {
                        pageController.jumpToPage(0);
                      }),
                  IconButton(
                    icon: Icon(Icons.grid_view, color: Colors.pinkAccent),
                    onPressed: showDrawer,
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.pinkAccent),
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
      color: Colors.black.withOpacity(0.8),
      border: Border(
        top: BorderSide(
          color: Colors.pink,
          width: 3.0,
        ),
      ),
    );
  }

  BoxDecoration drawerDecoration() {
    return BoxDecoration(
      border: Border.all(color: AppStyleConfig.appColors['pink'], width: 2.0),
      borderRadius: BorderRadius.all(
          Radius.circular(3.0) //                 <--- border radius here
          ),
    );
  }
}
