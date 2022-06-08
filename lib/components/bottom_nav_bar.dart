import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../enums.dart';
import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.selectedMenu}) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color notActiveColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.15))
          ],
          borderRadius: BorderRadius.circular(20)),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home_outlined,
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/patient.svg')),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/outpatient.svg')),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: MenuState.other == selectedMenu
                        ? kPrimaryColor
                        : notActiveColor,
                  )),
            ],
          )),
    );
  }
}
