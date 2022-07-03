import 'package:flutter/material.dart';
import 'package:hospital_management/screen/home/home_screen.dart';
import 'package:hospital_management/screen/home/home_view_mode.dart';
import 'package:hospital_management/screen/outpatient/outpatient_view_model.dart';
import 'package:hospital_management/screen/register/register.dart';

import 'package:hospital_management/screen/signin/sign_in_screen.dart';
import 'package:hospital_management/screen/onboarding/onboarding_screen.dart';
import 'package:hospital_management/screen/patient/patient_view_model.dart';
import 'package:hospital_management/screen/report/report_view_model.dart';
import 'package:hospital_management/screen/signin/sign_in_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showLogin = prefs.getBool('showLogin') ?? false;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PatientViewModel()),
    ChangeNotifierProvider(create: (_) => ReportViewModel()),
    ChangeNotifierProvider(create: (_) => SignInViewModel()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ChangeNotifierProvider(
      create: (_) => OutpatientViewModel(),
    )
  ], child: MyApp(showLogin: showLogin)));
}

class MyApp extends StatelessWidget {
  final bool showLogin;
  const MyApp({Key? key, required this.showLogin}) : super(key: key);
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
      initialRoute: showLogin ? '/signin' : '/onBoarding',
      routes: {
        '/onBoarding': (context) => const OnboardingScreen(),
        '/signin': (context) => const SignIn(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
