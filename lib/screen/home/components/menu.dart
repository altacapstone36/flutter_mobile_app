import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/components/loading_toast.dart';
import 'package:hospital_management/screen/attendance/attendance_screen.dart';
import 'package:hospital_management/screen/home/home_view_mode.dart';
import 'package:hospital_management/screen/outpatient/outpatient_screen.dart';
import 'package:hospital_management/screen/patient/patient_data.dart';
import 'package:hospital_management/screen/report/report_screen.dart';
import 'package:hospital_management/screen/schedule/schedule_screen.dart';
import 'package:provider/provider.dart';

import '../../../components/menu_card.dart';
import '../../../constants.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.only(right: 10),
        crossAxisCount: 3,
        children: [
          MenuCard(
              size: size,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PatientDataScreen(
                              showBack: true,
                            )));
              },
              image: 'assets/icons/patientData.svg',
              title: 'Patient Data'),
          MenuCard(
              size: size,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return const ScheduleScreen();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              image: 'assets/icons/schedule.svg',
              title: 'Schedule'),
          MenuCard(
              size: size,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return const ReportScreen();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              image: 'assets/icons/report.svg',
              title: 'Report Log'),
          MenuCard(
              size: size,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return const AttendanceScreen();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              image: 'assets/icons/attendance.svg',
              title: 'Attendance'),
          MenuCard(
              size: size,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OutpatientScreen(
                              showBack: true,
                            )));
              },
              image: 'assets/icons/outpatienthHome.svg',
              title: 'Outpatient'),
          MenuCard(
              size: size,
              onTap: () async {
                var viewModel =
                    Provider.of<HomeViewModel>(context, listen: false);
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return const LoadingToast(message: 'Logging Out...');
                    });
                await viewModel.logOut();
                Navigator.pop(context);
                if (viewModel.message != null || viewModel.message != '') {
                  Fluttertoast.showToast(
                      msg: viewModel.message!.toString(),
                      backgroundColor: Colors.white,
                      textColor: kPrimaryColor);
                  Navigator.pushReplacementNamed(context, '/signin');
                }
              },
              image: 'assets/icons/logOut.svg',
              title: 'Log Out'),
        ],
      ),
    );
  }
}
