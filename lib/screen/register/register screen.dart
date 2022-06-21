import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/register/body/body_register_screen.dart';

import 'package:hospital_management/screen/signin/sign_in_screen.dart';




class RegisterScreen extends StatelessWidget {
  final int _numPages = 0;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  String _radioValue = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/signup.svg',
                  width: 200,
                  height: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 50.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: kSecondaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: kDarkColor,
                              offset: Offset(10, 15),
                              blurRadius: 30,
                            ),
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: kSecondaryColor,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Your Name Here',
                                labelStyle: TextStyle(
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
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: kSecondaryColor,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Enter Email',
                                    labelStyle: TextStyle(
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
                              Column(children: <Widget>[
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Password',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: kSecondaryColor,
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Create Password',
                                      labelStyle: TextStyle(
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
                                Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Gender',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Radio(
                                            value: "1",
                                            groupValue: _radioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _radioValue = value.toString();
                                              });
                                            }),
                                        Text(
                                          'Male',
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Radio(
                                            value: "2",
                                            groupValue: _radioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                _radioValue = value.toString();
                                              });
                                            }),
                                        Text(
                                          'Female',
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 40.0,
                                  margin: EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  child: FlatButton(
                                    child: Text('Next'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BodyRegisterScreen()),
                                      );
                                    },
                                    color: kPrimaryColor,
                                    textColor: kSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()))
                  },
                  child: Text(
                    "Don Have an Account yet? Sign In",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: kDarkColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
