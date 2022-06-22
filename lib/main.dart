import 'package:flutter/material.dart';
import 'package:hospital_management/screen/home/home_screen.dart';
import 'package:hospital_management/screen/signin/sign_in_screen.dart';
import 'package:hospital_management/screen/onboarding/onboarding_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.purple,
      ),
      home: OnboardingScreen(),
      routes: {
        'signin':(context) => SignIn(),
      },
    );
  }
}
