import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/detail_patient/component/shimmer_detail_patient.dart';
import 'package:hospital_management/screen/detail_patient/detail_patient_view_model.dart';
import 'package:provider/provider.dart';
// import 'package:hospital_management/model/patient/patient_model.dart';

import '../../constants.dart';
// import '../../model/patient/medic_record_model.dart';

class DetailPatientScreen extends StatefulWidget {
  const DetailPatientScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<DetailPatientScreen> createState() => _DetailPatientScreenState();
}

class _DetailPatientScreenState extends State<DetailPatientScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<DetailPatientViewModel>(context, listen: false)
          .getPatientDetail(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DetailPatientViewModel>(context);
    int id = 1;

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Detail Patient',
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
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () {
              return Provider.of<DetailPatientViewModel>(context, listen: false)
                  .getPatientDetail(widget.id);
            },
            child: Consumer<DetailPatientViewModel>(
              builder: (context, state, child) {
                if (state.stateType == DataState.loading) {
                  return ShimmerDetailPatient(size: size);
                }
                if (state.stateType == DataState.error) {
                  return Center(
                    child: Text(viewModel.error!),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      //height: size.height * 0.19,
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
                              'Kode Pasien :  ${viewModel.patientDataId.code}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                                'NIK :  ${viewModel.patientDataId.nationalId}',
                                style: const TextStyle(fontSize: 14)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                                'Nama Pasien :  ${viewModel.patientDataId.fullName}',
                                style: const TextStyle(fontSize: 14)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                                'Jenis Kelamin :  ${viewModel.patientDataId.gender}',
                                style: const TextStyle(fontSize: 14)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                                'Golongan Darah :  ${viewModel.patientDataId.bloodType}',
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
                          headingRowColor:
                              MaterialStateProperty.all(kSecondaryColor),
                          columns: const [
                            DataColumn(label: Text('No')),
                            DataColumn(label: Text('Tgl Periksa')),
                            DataColumn(label: Text('Keluhan')),
                            DataColumn(label: Text('Diagnosa')),
                          ],
                          rows: [
                            ...viewModel.medicRecord.map((e) => DataRow(cells: [
                                  DataCell(Text(id.toString())),
                                  DataCell(Text(e.dateCheck!)),
                                  DataCell(Text(e.complaint!)),
                                  DataCell(Text(e.diagnose!)),
                                ]))
                          ]),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedMenu: MenuState.patient,
      ),
    );
  }
}
