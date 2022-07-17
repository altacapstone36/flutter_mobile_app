import 'package:flutter/material.dart';

class OtherMenu extends StatelessWidget {
  const OtherMenu(
      {Key? key, required this.onTap, required this.title, required this.icon})
      : super(key: key);
  final void Function() onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFFFDFBFB);
    const Color fontColor = Color(0xFF5B5B5B);
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: bgColor,
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(color: fontColor),
            ),
            trailing: Icon(
              icon,
              color: fontColor,
            ),
          )),
    );
  }
}
