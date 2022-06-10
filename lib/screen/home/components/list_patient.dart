import 'package:flutter/material.dart';
import 'package:hospital_management/components/item_card.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/model/outpatient_model.dart';

import '../../detail_outpatient/detail_outpatient.dart';

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
                ...List.generate(
                    outpatientList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ItemCard(
                              size: size,
                              waktu: outpatientList[index].waktu!,
                              nama: outpatientList[index].nama!,
                              antrian: outpatientList[index].antrian!,
                              kode: outpatientList[index].kode!,
                              keluhan: outpatientList[index].keluhan!,
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                  return DetailOutpatient(
                                    waktu: outpatientList[index].waktu!,
                                    nama: outpatientList[index].nama!,
                                    kode: outpatientList[index].kode!,
                                    keluhan: outpatientList[index].keluhan!,
                                  );
                                }, transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                  final tween = Tween(begin: 0.0, end: 2.0);
                                  return FadeTransition(
                                    opacity: animation.drive(tween),
                                    child: child,
                                  );
                                }));
                              }),
                        ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
