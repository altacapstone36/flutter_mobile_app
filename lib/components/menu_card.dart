import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {Key? key,
      required this.size,
      required this.onTap,
      required this.image,
      required this.title})
      : super(key: key);

  final Size size;
  final void Function() onTap;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height * 0.12,
          width: size.height * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 2,
                    offset: const Offset(0, 0.5))
              ]),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(image,
                    width: size.height * 0.08, height: size.height * 0.08),
              ),
              Text(
                title,
                style: const TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
