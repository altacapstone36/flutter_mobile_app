import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/model/patient/medic_record_model.dart';
import 'package:hospital_management/model/patient/patient_model.dart';
import 'package:hospital_management/model/report/report_model.dart';
import 'package:hospital_management/screen/report/report_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../patient/patient_view_model.dart';

class DetailOutpatient extends StatefulWidget {
  const DetailOutpatient(
      {Key? key,
      required this.idPasien,
      required this.idRecord,
      required this.waktu,
      required this.nama,
      required this.kode,
      required this.keluhan})
      : super(key: key);

  final String waktu, nama, kode, keluhan;
  final int idPasien, idRecord;

  @override
  State<DetailOutpatient> createState() => _DetailOutpatientState();
}

class _DetailOutpatientState extends State<DetailOutpatient> {
  var diagnosa = TextEditingController();
  var obat = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final patientViewModel = Provider.of<PatientViewModel>(context);
    final reportViewModel = Provider.of<ReportViewModel>(context);
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
        padding: const EdgeInsets.fromLTRB(13, 15, 13, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.19,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.fromLTRB(13, 13, 13, 10),
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
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: Text(widget.waktu),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          widget.nama,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          widget.kode,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kSecondaryColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          widget.keluhan,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kSecondaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 70.0, bottom: 10),
                  child: Text('Diagnosis',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor)),
                ),
                TextFormField(
                  controller: diagnosa,
                  minLines: 4,
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintText: 'Tuliskan hasil diagnosa disini....',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Diagnosa tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Text('Medical Prescription',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor)),
                ),
                TextFormField(
                  controller: obat,
                  minLines: 4,
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintText: 'Tuliskan resep disini...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Resep tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String date =
                                DateFormat('dd/mm/yyy').format(DateTime.now());
                            String diagnosis = diagnosa.value.text;
                            patientViewModel.addMedicRecord(
                                MedicRecord(
                                    id: widget.idRecord,
                                    date: date,
                                    keluhan: widget.keluhan,
                                    diagnosa: diagnosis),
                                widget.idPasien);
                            reportViewModel
                                .addReport(ReportModel(kode: widget.kode));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Succes')),
                            );
                            print('diagnosis = ' + diagnosis);
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                        child: const Text('COMPLETE')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(selectedMenu: MenuState.outpatient),
    );
  }
}
