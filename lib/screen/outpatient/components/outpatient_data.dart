import 'package:flutter/material.dart';
import 'package:hospital_management/components/item_card.dart';
import 'package:hospital_management/model/outpatient_model.dart';
import 'package:hospital_management/screen/detail_outpatient/detail_outpatient.dart';

class OutpatientData extends StatelessWidget {
  const OutpatientData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GridView.builder(
        itemCount: outpatientList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          return ItemCard(
              size: size,
              waktu: outpatientList[index].waktu!,
              nama: outpatientList[index].nama!,
              antrian: outpatientList[index].antrian!,
              kode: outpatientList[index].kode!,
              keluhan: outpatientList[index].keluhan!,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return DetailOutpatient(
                    waktu: outpatientList[index].waktu!,
                    nama: outpatientList[index].nama!,
                    kode: outpatientList[index].kode!,
                    keluhan: outpatientList[index].keluhan!,
                  );
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              });
        },
      ),
    );
  }
}
