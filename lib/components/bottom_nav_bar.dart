import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/screen/home/home_screen.dart';
import 'package:hospital_management/screen/other/other_screen.dart';
import 'package:hospital_management/screen/outpatient/outpatient_screen.dart';
import 'package:hospital_management/screen/patient/patient_data.dart';

import '../enums.dart';
import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedMenu}) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color notActiveColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -4),
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.5))
          ],
          borderRadius: BorderRadius.circular(20)),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    const HomeScreen()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero));
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    const PatientDataScreen()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero)
                        // MaterialPageRoute(
                        //     builder: (_) => const PatientDataScreen()),
                        );
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/patient.svg',
                    color: MenuState.patient == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    const OutpatientScreen()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero));
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/outpatient.svg',
                    color: MenuState.outpatient == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    const OtherScreen()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero));
                  },
                  icon: Icon(
                    Icons.menu,
                    color: MenuState.other == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
            ],
          )),
    );
  }
}
