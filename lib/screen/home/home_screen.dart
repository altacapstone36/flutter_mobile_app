import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';

import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/home/components/list_patient.dart';

import '../../components/item_card.dart';
import 'components/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(size: size),
            const PatientList(),
          ]),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
