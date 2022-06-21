import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/onboarding/onboarding_screen.dart';
import 'package:hospital_management/screen/register/register%20screen.dart';



class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/signin.svg',
                    width: 200,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: kSecondaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: kDarkColor,
                              offset: Offset(10, 15),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 30.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: kSecondaryColor,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    color: kDarkColor,
                                  ),
                                  fillColor: kSecondaryColor,
                                  prefixIcon:
                                      Icon(Icons.person, color: kDarkColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
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
                                  labelText: "password",
                                  labelStyle: TextStyle(
                                    color: kDarkColor,
                                  ),
                                  fillColor: kSecondaryColor,
                                  prefixIcon:
                                      Icon(Icons.lock, color: kDarkColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              width: double.infinity,
                              child: FlatButton(
                                child: Text('Sign In'),
                                onPressed: () {},
                                color: kPrimaryColor,
                                textColor: kSecondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: kDarkColor,
                                  fontFamily: "Nunito",
                                  fontSize: 10.0,
                                ),
                              ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()))
                    },
                    child: Text(
                      "Don Have an Account yet? Sign Up",
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
          ],
        ),
      ),
    );
  }
}
