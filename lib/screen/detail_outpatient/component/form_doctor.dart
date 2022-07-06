import 'package:flutter/material.dart';
import 'package:hospital_management/screen/detail_outpatient/component/form_nurse.dart';

import '../../../constants.dart';
import '../../patient/components/card_patient.dart';

class FormDoctor extends StatefulWidget {
  const FormDoctor({Key? key}) : super(key: key);

  @override
  State<FormDoctor> createState() => _FormDoctorState();
}

class _FormDoctorState extends State<FormDoctor> {
  var diagnosa = TextEditingController();
  var obat = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 35.0, bottom: 15),
            child: Text('Medical Check Up',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor)),
          ),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
                onPressed: !isSelected
                    ? () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                // height: size.height * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Expanded(
                                        child: ListView(children: [
                                          PatientCard(
                                              id: 1.toString(),
                                              nama: 'Priscilla',
                                              kode: 'Kode Suster : NR001'),
                                          PatientCard(
                                              id: 1.toString(),
                                              nama: 'Priscilla',
                                              kode: 'Kode Suster : NR001'),
                                        ]),
                                      ),
                                      SizedBox(
                                        width: size.width,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                isSelected = true;
                                              });
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: kPrimaryColor),
                                            child: const Text('Assign Nurse')),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    : null,
                style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                child: Text(
                    !isSelected ? 'Select Available Nurse' : 'Nurse Selected')),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 10),
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
                hintText: 'Type in here....',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Diagnosis can't be empty ";
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
                hintText: 'Type in here...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Medical Perscription can't be empty";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: SizedBox(
              width: size.width,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // String date =
                      //     DateFormat('dd/mm/yyy').format(DateTime.now());
                      // String diagnosis = diagnosa.value.text;
                      // patientViewModel.addMedicRecord(
                      //     MedicRecord(
                      //         id: widget.idRecord,
                      //         date: date,
                      //         keluhan: widget.keluhan,
                      //         diagnosa: diagnosis),
                      //     widget.idPasien);
                      // reportViewModel
                      //     .addReport(ReportModel(kode: widget.kode));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Succes')),
                      // );
                      // print('diagnosis = ' + diagnosis);
                      // Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  child: const Text('COMPLETE')),
            ),
          )
        ],
      ),
    );
  }
}
