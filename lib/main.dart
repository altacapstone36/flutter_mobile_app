import 'package:flutter/material.dart';
import 'package:hospital_management/screen/home/home_screen.dart';
<<<<<<< Updated upstream
=======
import 'package:hospital_management/screen/patient/patient_view_model.dart';
import 'package:hospital_management/screen/report/report_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PatientViewModel()),
    ChangeNotifierProvider(create: (_) => ReportViewModel())
  ], child: const MyApp()));
>>>>>>> Stashed changes
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
