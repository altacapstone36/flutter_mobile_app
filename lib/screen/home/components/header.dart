import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/screen/home/home_view_mode.dart';
import 'package:hospital_management/screen/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../model/user/model_user.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String? name;
  String? title;
  Data userData = Data(
      id: 0,
      code: '',
      email: '',
      fullName: '---',
      gender: '-',
      roles: '-',
      facility: '-');
  late SharedPreferences prefs;

  @override
  void initState() {
    // initial();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<HomeViewModel>(context, listen: false).getUser();
    });
    super.initState();
  }

  void initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      var data = prefs.getString('user');
      var dataDecode = jsonDecode(data!);
      userData = Data.fromJson(dataDecode);
    });
  }

  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);

    return Stack(children: [
      Container(
        height: widget.size.height * 0.22,
        width: widget.size.width,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -15), blurRadius: 20, color: Colors.grey),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: kPrimaryColor),
        padding: const EdgeInsets.only(top: 35, bottom: 10),
        //margin: EdgeInsets.symmetric(vertical: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 16),
              child: Text(
                greetingMessage(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return ProfileScreen(
                      name: viewModel.dataUser.fullName!,
                      code: viewModel.dataUser.code!,
                      email: viewModel.dataUser.email!,
                      gender: viewModel.dataUser.gender!,
                      role:
                          '${viewModel.dataUser.roles} ${viewModel.dataUser.facility}');
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    viewModel.dataUser.fullName![0],
                    style: const TextStyle(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                title: Text(
                  // userData.fullName!.toString(),
                  viewModel.dataUser.fullName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                      fontSize: 18),
                ),
                subtitle: Text(
                  '${viewModel.dataUser.roles} ${viewModel.dataUser.facility}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kSecondaryColor,
                      fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
      Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset('assets/images/Ellipse1.svg')),
      Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset('assets/images/Ellipse2.svg')),
    ]);
  }
}
