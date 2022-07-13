import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/attendance/attendance_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
  String imageCheckIn = 'assets/images/check1.svg';
  String imageCheckOut = 'assets/images/check2.svg';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<AttendanceViewModel>(context, listen: false).reset();
    });
  }

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
          backgroundColor: Colors.white,
          textColor: kPrimaryColor,
        );

    final Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<AttendanceViewModel>(context, listen: false);
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
                        (viewModel.checkIn == '--/--')
                            ? imageCheckIn
                            : (viewModel.checkOut == '--/--')
                                ? imageCheckOut
                                : imageDone,
                        height: size.height * 0.3,
                        width: size.height * 0.27,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        (viewModel.checkIn == '--/--' &&
                                viewModel.checkOut == '--/--')
                            ? 'You can check in now. Pump it up!'
                            : (viewModel.checkIn != '--/--' &&
                                    viewModel.checkOut == '--/--')
                                ? "You can check out now. \nEnjoy yout time off"
                                : 'You all set, see you tomorrow',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Check in time \t\t: ${viewModel.checkIn}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Check out time : ${viewModel.checkOut}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: viewModel.visible,
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        checkInTime();
                        viewModel.visible = !viewModel.visible;
                        viewModel.checkIn = checkIn;
                        showToast('Check In Succes');
                      },
                      style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                      child: const Text('Check In')),
                ),
              ),
              Visibility(
                visible: !viewModel.visible,
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                      onPressed: (viewModel.checkOut == '--/--')
                          ? () {
                              checkOutTime();
                              setState(() {
                                // viewModel.visible = !viewModel.visible;
                                viewModel.checkOut = checkOut;
                                showToast('Check Out Succes');
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                      child: Text((viewModel.checkOut == '--/--')
                          ? 'Check Out'
                          : 'All done for today')),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.other),
    );
  }
}
