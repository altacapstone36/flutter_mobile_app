import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String checkIn = '--/--';
  String checkOut = '--/--';
  String imageDone = 'assets/images/done.svg';
  String imageCheck = 'assets/images/check1.svg';

  @override
  Widget build(BuildContext context) {
    checkInTime() {
      setState(() {
        checkIn = DateFormat('hh:mm a').format(DateTime.now());
      });
    }

    checkOutTime() {
      checkOut = DateFormat('hh:mm a').format(DateTime.now());
    }

    void showToast(String m) => Fluttertoast.showToast(
          msg: m,
          gravity: ToastGravity.CENTER,
          fontSize: 18,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
        );

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Attendace',
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
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        checkOut != '--/--' ? imageDone : imageCheck,
                        height: size.height * 0.3,
                        width: size.height * 0.27,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        checkOut != '--/--'
                            ? 'You all set, see you tomorrow'
                            : 'You can check in now. Pump it up!',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Check in time \t\t: $checkIn',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Check out time : $checkOut',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              checkOut != '--/--'
                  ? SizedBox(
                      width: size.width,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFB0B0B0)),
                          child: const Text('All Done for Today',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kSecondaryColor))),
                    )
                  : SizedBox(
                      width: size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            if (checkIn == '--/--') {
                              showToast('Check in Succes');
                              return checkInTime();
                            }
                            setState(() {
                              if (checkOut == '--/--') {
                                showToast('Check Out Succes');
                                return checkOutTime();
                              }
                            });
                          },
                          style:
                              ElevatedButton.styleFrom(primary: kPrimaryColor),
                          child: Text(
                              checkIn == '--/--' ? 'Check In' : 'Checkout',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))),
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.other),
    );
  }
}
