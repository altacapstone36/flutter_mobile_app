import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/model/patient/patient_model.dart';

import '../../constants.dart';
import '../../model/patient/medic_record_model.dart';

class DetailPatientScreen extends StatelessWidget {
  const DetailPatientScreen(
      {Key? key,
      required this.kode,
      required this.nik,
      required this.nama,
      required this.jKel,
      required this.darah,
      required this.medic})
      : super(key: key);
  final String kode, nama, jKel, darah;
  final int nik;
  final List<MedicRecord> medic;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Outpatient',
          style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.19,
                width: size.width,
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 0.5,
                        offset: const Offset(0, 0.1))
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'Kode Pasien : $kode',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('NIK : $nik',
                          style: const TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('Nama Pasien : $nama',
                          style: const TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('Jenis Kelamin : $jKel',
                          style: const TextStyle(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text('Golongan Darah : $darah',
                          style: const TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Medic Record (Scroll Arround)',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    headingRowColor: MaterialStateProperty.all(kSecondaryColor),
                    columns: const [
                      DataColumn(label: Text('No')),
                      DataColumn(label: Text('Tgl Periksa')),
                      DataColumn(label: Text('Keluhan')),
                      DataColumn(label: Text('Diagnosa')),
                    ],
                    rows: [
                      ...medic.map((e) => DataRow(cells: [
                            DataCell(Text(e.id.toString())),
                            DataCell(Text(e.date!)),
                            DataCell(Text(e.keluhan!)),
                            DataCell(Text(e.diagnosa!)),
                          ]))
                    ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedMenu: MenuState.patient,
      ),
    );
  }
}
