import 'package:flutter/material.dart';
import 'package:hospital_management/screen/patient/components/card_patient.dart';

class ListPatient extends StatelessWidget {
  const ListPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: ((context, index) {
            return const PatientCard(id: '1', nama: 'Zuli', kode: 'RM001');
          })),
    );
  }
}
