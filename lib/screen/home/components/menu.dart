import 'package:flutter/material.dart';

import '../../../components/menu_card.dart';

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
              onTap: () {},
              image: 'assets/icons/patientData.svg',
              title: 'Patient Data'),
          MenuCard(
              size: size,
              onTap: () {},
              image: 'assets/icons/schedule.svg',
              title: 'Schedule'),
          MenuCard(
              size: size,
              onTap: () {},
              image: 'assets/icons/report.svg',
              title: 'Report Log'),
          MenuCard(
              size: size,
              onTap: () {},
              image: 'assets/icons/attendance.svg',
              title: 'Attendance'),
          MenuCard(
              size: size,
              onTap: () {},
              image: 'assets/icons/outpatienthHome.svg',
              title: 'Outpatient'),
          MenuCard(
              size: size,
              onTap: () {},
              image: 'assets/icons/logOut.svg',
              title: 'Log Out'),
        ],
      ),
    );
  }
}
