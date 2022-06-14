import 'package:flutter/material.dart';
import 'package:hospital_management/screen/detail_patient/detail_patient.dart';
import 'package:hospital_management/screen/patient/components/card_patient.dart';
import 'package:hospital_management/screen/patient/patient_view_model.dart';
import 'package:provider/provider.dart';

class ListPatient extends StatelessWidget {
  const ListPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PatientViewModel>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: viewModel.patients.length,
          itemBuilder: ((context, index) {
            int id = index + 1;
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return DetailPatientScreen(
                      kode: viewModel.patients[index].kode!,
                      nik: viewModel.patients[index].nik!,
                      nama: viewModel.patients[index].nama!,
                      jKel: viewModel.patients[index].jKel!,
                      darah: viewModel.patients[index].darah!);
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 2.0);
                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                }));
              },
              child: PatientCard(
                  id: id.toString(),
                  nama: viewModel.patients[index].nama!,
                  kode: viewModel.patients[index].kode!),
            );
          })),
    );
  }
}
