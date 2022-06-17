import 'package:flutter/material.dart';
import 'package:hospital_management/components/item_card.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/model/outpatient_model.dart';
import 'package:hospital_management/screen/patient/patient_view_model.dart';
import 'package:provider/provider.dart';

import '../../detail_outpatient/detail_outpatient.dart';

class PatientList extends StatelessWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<PatientViewModel>(context);
    int id = 1;
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
                    viewModel.patients.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ItemCard(
                              size: size,
                              waktu: viewModel.patients[index].waktu!,
                              nama: viewModel.patients[index].nama!,
                              antrian:
                                  viewModel.patients[index].antri!.toString(),
                              kode: viewModel.patients[index].kode!,
                              keluhan: viewModel
                                  .patients[index].medicRecord[0].keluhan!,
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                  return DetailOutpatient(
                                    idPasien: index,
                                    idRecord: id,
                                    waktu: viewModel.patients[index].waktu!,
                                    nama: viewModel.patients[index].nama!,
                                    kode: viewModel.patients[index].kode!,
                                    keluhan: viewModel.patients[index]
                                        .medicRecord[0].keluhan!,
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
