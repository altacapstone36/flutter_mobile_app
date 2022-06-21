import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/signin/sign_in_screen.dart';

import 'content/content.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                height: 80.0,
                child: FlatButton(
                  onPressed: () {
                    if (_currentPage == _numPages - 3) {
                      Navigator.of(
                        context,
                      ).pushNamed('signin');
                    }
                    _pageController.nextPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Skip',
                        style: TextStyle(
                          color: kDarkColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: kDarkColor,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: kThemeAnimationDuration,
                height: 400.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Spacer(),
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/splash1.svg',
                              height: 200.0,
                              width: 300.0,
                            ),
                          ),
                          Spacer(),
                          SizedBox(height: 15.0),
                          Text(
                            'Process Outpatient Easly',
                            style: kTitle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'With this App can proceed your Outpatient Easly with the feature available',
                            style: kSubtitle,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Reportm Work in Mobile',
                              style: kTitle,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Procees your work easly with the Report function',
                            style: kSubtitle,
                          ),
                          Spacer(),
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/splash2.svg',
                              height: 200.0,
                              width: 300.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Spacer(),
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/splash3.svg',
                              height: 200.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Patient Data Search Feature',
                            style: kTitle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Search your Patient Data with an ease just press one button and done',
                            style: kSubtitle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _numPages,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 40.0,
                margin: EdgeInsets.all(20.0),
                width: 150.0,
                child: FlatButton(
                  child: Text(
                    _currentPage == _numPages - 1 ? 'Get Started' : 'Next',
                  ),
                  onPressed: () {
                    if (_currentPage == _numPages - 1) {
                      Navigator.of(
                        context,
                      ).pushNamed('signin');
                    }
                    _pageController.nextPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  color: kPrimaryColor,
                  textColor: kSecondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      height: 10.0,
      width: _currentPage == index ? 10 : 10,
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _currentPage == index ? kPrimaryColor : kDarkColor,
      ),
    );
  }
}
