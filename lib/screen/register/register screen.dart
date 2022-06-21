import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/register/body/body_register_screen.dart';

import 'package:hospital_management/screen/signin/sign_in_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final int _numPages = 0;

  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;

  String _radioValue = "1";
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    void setState(Null Function() param0) {}
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 45, 13, 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: SvgPicture.asset(
                    'assets/images/signup.svg',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: size.width * 0.91,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: kSecondaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 5,
                            offset: const Offset(3, 6))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Your Name Here',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          labelStyle: const TextStyle(
                            color: kDarkColor,
                            fontSize: 16.0,
                          ),
                          fillColor: kSecondaryColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          hintText: 'Enter Email',
                          labelStyle: const TextStyle(
                            color: kDarkColor,
                            fontSize: 16.0,
                          ),
                          fillColor: kSecondaryColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Create Password',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          labelStyle: const TextStyle(
                            color: kDarkColor,
                            fontSize: 16.0,
                          ),
                          fillColor: kSecondaryColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Male'),
                      ),
                      ListTile(
                        leading: Radio<String>(
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        title: const Text('Female'),
                      ),
                      //
                      SizedBox(
                        width: size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BodyRegisterScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor),
                            child: const Text('Next')),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()))
                    },
                    child: const Text(
                      "Already Have an Account? Sign In",
                      style: TextStyle(
                        fontSize: 14.0,
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
      ),
    );
  }
}
