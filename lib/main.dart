import 'package:flutter/material.dart';

import 'package:hospital_management/screen/signin/sign_in_screen.dart';
import 'package:hospital_management/screen/onboarding/onboarding_screen.dart';
import 'package:hospital_management/screen/patient/patient_view_model.dart';
import 'package:hospital_management/screen/report/report_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PatientViewModel()),
    ChangeNotifierProvider(create: (_) => ReportViewModel())
  ], child: MyApp()));
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
        'signin': (context) => SignIn(),
      },
    );
  }
}
