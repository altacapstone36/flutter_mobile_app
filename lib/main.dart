import 'package:flutter/material.dart';
import 'package:hospital_management/screen/detail_outpatient/detail_outpatient_view_model.dart';
import 'package:hospital_management/screen/home/home_screen.dart';
import 'package:hospital_management/screen/detail_patient/detail_patient_view_model.dart';
import 'package:hospital_management/screen/outpatient/outpatient_view_model.dart';
import 'package:hospital_management/screen/home/home_view_mode.dart';
import 'package:hospital_management/screen/register/register.dart';

import 'package:hospital_management/screen/signin/sign_in_screen.dart';
import 'package:hospital_management/screen/onboarding/onboarding_screen.dart';
import 'package:hospital_management/screen/patient/patient_view_model.dart';
import 'package:hospital_management/screen/report/report_view_model.dart';
import 'package:hospital_management/screen/signin/sign_in_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showLogin = prefs.getBool('showLogin') ?? false;
  final isLogin = prefs.getBool('isLogin') ?? false;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DetailOutpatientViewModel()),
        ChangeNotifierProvider(create: (_) => DetailPatientViewModel()),
        ChangeNotifierProvider(create: (_) => PatientViewModel()),
        ChangeNotifierProvider(create: (_) => ReportViewModel()),
        ChangeNotifierProvider(create: (_) => SignInViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(
          create: (_) => OutpatientViewModel(),
        ),
      ],
      child: MyApp(
        showLogin: showLogin,
        isLogin: isLogin,
      )));
}

class MyApp extends StatelessWidget {
  final bool showLogin;
  final bool isLogin;
  const MyApp({Key? key, required this.showLogin, required this.isLogin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Management',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.purple,
      ),
      //home: OnboardingScreen(),
      initialRoute: (showLogin && isLogin)
          ? '/home'
          : (showLogin)
              ? '/signin'
              : '/onBoarding',
      routes: {
        '/onBoarding': (context) => const OnboardingScreen(),
        '/signin': (context) => const SignIn(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
