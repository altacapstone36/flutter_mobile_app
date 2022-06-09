import 'package:flutter/material.dart';

import '../../../constants.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {Key? key, required this.id, required this.nama, required this.kode})
      : super(key: key);
  final String id, nama, kode;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor,
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: kSecondaryColor,
            child: Text(
              id,
              style: const TextStyle(color: Colors.black),
            )),
        title: Text(nama),
        subtitle: Text('Kode Pasien : $kode'),
      ),
    );
  }
}
