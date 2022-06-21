import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management/constants.dart';

import '../../signin/sign_in_screen.dart';

class BodyRegisterScreen extends StatelessWidget {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  String _radioValue = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              height: 80.0,
              child: FlatButton(
                onPressed: () {
                  if (_currentPage == _numPages - 2) {
                    Navigator.of(
                      context,
                    ).pushNamed('signin');
                  }
                  _pageController.nextPage(
                    duration: const Duration(microseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.navigate_before_outlined,
                      color: kDarkColor,
                      size: 40.0,
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: kDarkColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: kThemeAnimationDuration,
              height: 400.0,
              child: PageView(
                physics: const ClampingScrollPhysics(),
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
                        const Spacer(),
                        Center(
                          child: SvgPicture.asset(
                            'assets/images/signup.svg',
                            height: 200.0,
                            width: 300.0,
                          ),
                        ),
                        // Container(
                        //   alignment: Alignment.centerLeft,
                        //   margin: const EdgeInsets.symmetric(horizontal: 50.0),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5.0),
                        //       color: kSecondaryColor,
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           color: kDarkColor,
                        //           offset: Offset(10, 15),
                        //           blurRadius: 30,
                        //         ),
                        //       ]),
                        // ),
                        Column(children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Role',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                  value: "1",
                                  groupValue: _radioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioValue = value.toString();
                                    });
                                  }),
                              const Text(
                                'Doctor',
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                  value: "2",
                                  groupValue: _radioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioValue = value.toString();
                                    });
                                  }),
                              const Text(
                                'Nurse',
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                  value: "2",
                                  groupValue: _radioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioValue = value.toString();
                                    });
                                  }),
                              const Text(
                                'Pharmacist',
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ]),
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
                            'assets/images/signup.svg',
                            height: 200.0,
                            width: 300.0,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(horizontal: 50.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: kSecondaryColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: kDarkColor,
                                  offset: Offset(10, 15),
                                  blurRadius: 30,
                                ),
                              ]),
                        ),
                        Column(children: <Widget>[
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Specialyty',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                  value: "1",
                                  groupValue: _radioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioValue = value.toString();
                                    });
                                  }),
                              const Text(
                                'General Doctor',
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                  value: "2",
                                  groupValue: _radioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioValue = value.toString();
                                    });
                                  }),
                              const Text(
                                'Pediatrician',
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio(
                                  value: "2",
                                  groupValue: _radioValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _radioValue = value.toString();
                                    });
                                  }),
                              const Text(
                                'dentist',
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Spacer(),
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/forgotpass.svg',
                              height: 200.0,
                              width: 300.0,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: kSecondaryColor,
                                boxShadow: const [
                                  BoxShadow(
                                    color: kDarkColor,
                                    offset: Offset(10, 15),
                                    blurRadius: 30,
                                  ),
                                ]),
                          ),
                          Column(children: <Widget>[
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Enter Registered Email',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Container(
                              height: 30.0,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: kSecondaryColor,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle: const TextStyle(
                                    color: kDarkColor,
                                    fontSize: 12.0,
                                  ),
                                  fillColor: kSecondaryColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              height: 40.0,
              margin: const EdgeInsets.all(20.0),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  _currentPage == _numPages - 1
                      ? 'SEND RECOVERY EMAIL'
                      : 'Next',
                ),
                onPressed: () {
                  if (_currentPage == _numPages - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  }
                  _pageController.nextPage(
                    duration: const Duration(microseconds: 500),
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
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()))
                },
                child: const Text(
                  "Already Have an account? Sign In",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
