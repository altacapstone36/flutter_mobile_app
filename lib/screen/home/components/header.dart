import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/screen/profile/profile_screen.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: size.height * 0.22,
        width: size.width,
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
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0, left: 16),
              child: Text(
                'Good Morning',
                style: TextStyle(
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
                  return const ProfileScreen();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    'A',
                    style: TextStyle(color: kSecondaryColor),
                  ),
                ),
                title: Text(
                  'Alshad Ahmad',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                      fontSize: 18),
                ),
                subtitle: Text(
                  'General Doctor',
                  style: TextStyle(
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
