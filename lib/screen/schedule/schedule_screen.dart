import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

String date = DateFormat('EEE, MM/dd/yyyy').format(DateTime.now());

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Schedule',
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
        padding: const EdgeInsets.fromLTRB(16, 15, 16, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: IconButton(
                    onPressed: () async {
                      DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050));
                      if (datePicked != null) {
                        String dateFormat =
                            DateFormat('EEE, MM/dd/yyyy').format(datePicked);
                        setState(() {
                          date = dateFormat;
                        });
                        print(date);
                      }
                    },
                    icon: const Icon(Icons.calendar_today_outlined)),
                title: Text(
                  date,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                //Text(DateFormat('EEE, dd/mm/yyyy').format(DateTime.now())),
                trailing: Wrap(
                  spacing: 5,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                '08.00 - 11.00',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
            const Card(
              shadowColor: Colors.white,
              elevation: 0,
              borderOnForeground: false,
              color: kPrimaryColor,
              child: ListTile(
                minVerticalPadding: 0,
                title: Text(
                  'Jaga Poli',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.other),
    );
  }
}
