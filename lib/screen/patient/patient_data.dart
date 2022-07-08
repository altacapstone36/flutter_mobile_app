import 'package:flutter/material.dart';
import 'package:hospital_management/animation/fade_animation.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/detail_patient/detail_patient.dart';
import 'package:hospital_management/screen/patient/components/card_patient.dart';
import 'package:hospital_management/screen/patient/components/shimmer_card_patient.dart';
import 'package:hospital_management/screen/patient/patient_view_model.dart';
import 'package:provider/provider.dart';

class PatientDataScreen extends StatefulWidget {
  const PatientDataScreen({Key? key, required this.showBack}) : super(key: key);
  final bool showBack;

  @override
  State<PatientDataScreen> createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  final _query = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<PatientViewModel>(context, listen: false).getPatient();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<PatientViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: widget.showBack
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor))
            : null,
        title: const Text(
          'Patient Data',
          style: TextStyle(fontWeight: FontWeight.w700, color: kPrimaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RefreshIndicator(
          onRefresh: () {
            return Provider.of<PatientViewModel>(context, listen: false)
                .getPatient();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Search Patient Data',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
              ),
              TextField(
                  controller: _query,
                  textInputAction: TextInputAction.done,
                  // onChanged: (value) {},
                  decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      suffixIcon: _query.text.isEmpty || _query.text == ''
                          ? null
                          : IconButton(
                              onPressed: () {
                                _query.clear();
                                Provider.of<PatientViewModel>(context,
                                        listen: false)
                                    .getPatient();
                              },
                              icon: const Icon(Icons.clear)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)))),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        viewModel.searchPatient(_query.text);
                      },
                      style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                      child: const Text('Search')),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 10),
                child: Text(
                  'Patient List',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
              ),
              // const ListPatient(),
              Expanded(child:
                  Consumer<PatientViewModel>(builder: (context, state, child) {
                if (state.state == DataState.loading) {
                  return const CardPatientShimmer();
                }
                if (state.state == DataState.error) {
                  return Center(
                    child: Text(viewModel.eror!),
                  );
                }
                return ListView.builder(
                    itemCount: _query.text != ''
                        ? viewModel.patientByName.length
                        : viewModel.patients.length,
                    itemBuilder: (context, index) {
                      return FadeAnimation(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPatientScreen(
                                        id: _query.text != ''
                                            ? viewModel.patientByName[index].id!
                                            : viewModel.patients[index].id!)));
                          },
                          child: PatientCard(
                              id: _query.text != ''
                                  ? viewModel.patientByName[index].id!
                                      .toString()
                                  : viewModel.patients[index].id!.toString(),
                              nama: _query.text != ''
                                  ? viewModel.patientByName[index].fullName!
                                  : viewModel.patients[index].fullName!,
                              kode: _query.text != ''
                                  ? viewModel.patientByName[index].code!
                                  : viewModel.patients[index].code!),
                        ),
                      );
                    });
              }))
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.patient),
    );
  }
}
