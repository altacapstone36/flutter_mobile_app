import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/home/components/list_patient.dart';
import 'package:hospital_management/screen/patient/components/list_patient.dart';

class PatientDataScreen extends StatelessWidget {
  const PatientDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Patient Data',
          style: TextStyle(fontWeight: FontWeight.w700, color: kPrimaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Search Patient Data',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)))),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: size.width,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                    child: const Text('SEARCH')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 10),
              child: Text(
                'Patient List',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
            ),
            const ListPatient()
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.patient),
    );
  }
}
