import 'package:flutter/material.dart';
import 'package:hospital_management/components/item_card.dart';
import 'package:hospital_management/model/outpatient_model.dart';
import 'package:hospital_management/screen/detail_outpatient/detail_outpatient.dart';
import 'package:provider/provider.dart';

import '../../patient/patient_view_model.dart';

class OutpatientData extends StatelessWidget {
  const OutpatientData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<PatientViewModel>(context);

    return Expanded(
      child: GridView.builder(
        itemCount: viewModel.patients.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          return ItemCard(
              size: size,
              waktu: viewModel.patients[index].waktu!,
              nama: viewModel.patients[index].nama!,
              antrian: viewModel.patients[index].antri!.toString(),
              kode: viewModel.patients[index].kode!,
              keluhan: viewModel.patients[index].medicRecord[0].keluhan!,
              onTap: () {
                int id = viewModel.patients[index].medicRecord.length + 1;
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return DetailOutpatient(
                    idPasien: index,
                    idRecord: id,
                    waktu: viewModel.patients[index].waktu!,
                    nama: viewModel.patients[index].nama!,
                    kode: viewModel.patients[index].kode!,
                    keluhan: viewModel.patients[index].medicRecord[0].keluhan!,
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
