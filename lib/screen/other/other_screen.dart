import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/other/components/card_other_menu.dart';
import 'package:hospital_management/screen/report/report_screen.dart';
import 'package:hospital_management/screen/schedule/schedule_screen.dart';
import 'package:provider/provider.dart';

import '../../components/loading_toast.dart';
import '../../constants.dart';
import '../attendance/attendance_screen.dart';
import '../home/home_view_mode.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Other',
          style: TextStyle(fontWeight: FontWeight.w700, color: kPrimaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            OtherMenu(
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
                title: 'Schedule',
                icon: Icons.navigate_next_outlined),
            OtherMenu(
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
                title: 'Attendace',
                icon: Icons.navigate_next_outlined),
            OtherMenu(
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
                title: 'Report Log',
                icon: Icons.navigate_next_outlined),
            OtherMenu(
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
                title: 'Log Out',
                icon: Icons.logout_outlined)
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.other),
    );
  }
}
