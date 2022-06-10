import 'package:flutter/material.dart';

import '../constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key,
      required this.size,
      required this.waktu,
      required this.nama,
      required this.antrian,
      required this.kode,
      required this.keluhan,
      required this.onTap})
      : super(key: key);

  final Size size;
  final String waktu, nama, antrian, kode, keluhan;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.19,
        width: size.height * 0.19,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 2,
                  offset: const Offset(0, 0.5))
            ]),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                    child: Text(waktu),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                nama,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kSecondaryColor),
              ),
            ),
            Text(
              'Antrian: $antrian',
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: kSecondaryColor),
            ),
            Text(
              kode,
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: kSecondaryColor),
            ),
            Text(
              keluhan,
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: kSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
