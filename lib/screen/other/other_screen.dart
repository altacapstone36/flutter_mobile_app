import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/other/components/card_other_menu.dart';

import '../../constants.dart';

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
                onTap: () {},
                title: 'Schedule',
                icon: Icons.navigate_next_outlined),
            OtherMenu(
                onTap: () {},
                title: 'Attendace',
                icon: Icons.navigate_next_outlined),
            OtherMenu(
                onTap: () {},
                title: 'Report Log',
                icon: Icons.navigate_next_outlined),
            OtherMenu(
                onTap: () {}, title: 'Log Out', icon: Icons.logout_outlined)
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.other),
    );
  }
}
