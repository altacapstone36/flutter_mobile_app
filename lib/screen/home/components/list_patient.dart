import 'package:flutter/material.dart';
import 'package:hospital_management/components/item_card.dart';
import 'package:hospital_management/constants.dart';

class PatientList extends StatelessWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 13, top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today Outpatient',
            style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemCard(
                    size: size,
                    waktu: '08:00',
                    nama: 'Zuli',
                    antrian: '2',
                    kode: 'RM123',
                    keluhan: 'Gatal',
                    onTap: () {}),
                const SizedBox(
                  width: 15,
                ),
                ItemCard(
                    size: size,
                    waktu: '08:00',
                    nama: 'Zuli',
                    antrian: '2',
                    kode: 'RM123',
                    keluhan: 'Gatal',
                    onTap: () {}),
                const SizedBox(
                  width: 15,
                ),
                ItemCard(
                    size: size,
                    waktu: '08:00',
                    nama: 'Zuli',
                    antrian: '2',
                    kode: 'RM123',
                    keluhan: 'Gatal',
                    onTap: () {}),
                const SizedBox(
                  width: 15,
                ),
                ItemCard(
                    size: size,
                    waktu: '08:00',
                    nama: 'Zuli',
                    antrian: '2',
                    kode: 'RM123',
                    keluhan: 'Gatal',
                    onTap: () {}),
                const SizedBox(
                  width: 15,
                ),
                ItemCard(
                    size: size,
                    waktu: '08:00',
                    nama: 'Zuli',
                    antrian: '2',
                    kode: 'RM123',
                    keluhan: 'Gatal',
                    onTap: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
