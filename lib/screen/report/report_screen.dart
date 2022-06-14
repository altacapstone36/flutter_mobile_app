import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/model/outpatient_model.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: outpatientList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: kSecondaryColor,
                        child: ListTile(
                          title: Text(
                              'Submitted Report for ${outpatientList[index].kode}'),
                        ),
                      );
                    }))
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.other),
    );
  }
}
