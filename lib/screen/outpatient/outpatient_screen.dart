import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/outpatient/components/outpatient_data.dart';

import '../../constants.dart';

class OutpatientScreen extends StatelessWidget {
  const OutpatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Outpatient',
          style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
        child: Column(
          children: const [OutpatientData()],
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(selectedMenu: MenuState.outpatient),
    );
  }
}
