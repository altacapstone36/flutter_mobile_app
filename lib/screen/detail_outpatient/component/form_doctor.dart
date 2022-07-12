import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/components/loading_toast.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/model/outpatient/process_model.dart';
import 'package:hospital_management/screen/patient/components/shimmer_card_patient.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../detail_outpatient_view_model.dart';

class FormDoctor extends StatefulWidget {
  const FormDoctor({Key? key, required this.idPatient}) : super(key: key);
  final int idPatient;

  @override
  State<FormDoctor> createState() => _FormDoctorState();
}

class _FormDoctorState extends State<FormDoctor> {
  var diagnosa = TextEditingController();
  var obat = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSelected = false;
  int activeIndex = -1;
  int selectIndex = -2;
  var code = '';

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<DetailOutpatientViewModel>(context, listen: false).getNurse();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<DetailOutpatientViewModel>(context);
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
                                  child: StatefulBuilder(
                                    builder: (context, setStates) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Consumer<DetailOutpatientViewModel>(
                                              builder: (context, state, child) {
                                            if (state.stateType ==
                                                DataState.error) {
                                              return Center(
                                                child: Text(viewModel.message),
                                              );
                                            } else if (state.stateType ==
                                                DataState.loading) {
                                              return const Expanded(
                                                child: CardPatientShimmer(),
                                              );
                                            } else {
                                              return Expanded(
                                                  child: ListView.builder(
                                                itemCount:
                                                    viewModel.nurse.length,
                                                itemBuilder: (context, index) {
                                                  int id = index + 1;
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setStates(() {
                                                        debugPrint(
                                                            'index : $index');
                                                        code = viewModel
                                                            .nurse[index].code!;
                                                        debugPrint(code);
                                                        activeIndex = index;
                                                        selectIndex = index;
                                                      });
                                                    },
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          side: BorderSide(
                                                              color: (activeIndex ==
                                                                      index)
                                                                  ? kPrimaryColor
                                                                  : kSecondaryColor,
                                                              width: 2)),
                                                      color: kSecondaryColor,
                                                      child: ListTile(
                                                        leading: CircleAvatar(
                                                            backgroundColor:
                                                                kSecondaryColor,
                                                            child: Text(
                                                              id.toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                        title: Text(viewModel
                                                            .nurse[index]
                                                            .fullName!),
                                                        subtitle: Text(
                                                            'Kode suster : ${viewModel.nurse[index].code!}'),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ));
                                            }
                                          }),
                                          SizedBox(
                                            width: size.width,
                                            child: ElevatedButton(
                                                onPressed: (activeIndex ==
                                                        selectIndex)
                                                    ? () async {
                                                        setState(() {
                                                          isSelected = true;
                                                        });
                                                        showDialog(
                                                            barrierDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (context) {
                                                              return const LoadingToast(
                                                                  message:
                                                                      'Processing Data...');
                                                            });
                                                        var nurseData =
                                                            AssignNurseModel(
                                                                nurseCode:
                                                                    code);

                                                        await viewModel
                                                            .assignNurse(
                                                                nurseData,
                                                                widget
                                                                    .idPatient);
                                                        Navigator.pop(context);
                                                        Fluttertoast.showToast(
                                                            msg: viewModel
                                                                .message,
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                kPrimaryColor);
                                                        Navigator.pop(context);
                                                      }
                                                    : null,
                                                style: ElevatedButton.styleFrom(
                                                    primary: kPrimaryColor),
                                                child:
                                                    const Text('Assign Nurse')),
                                          )
                                        ],
                                      );
                                    },
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const LoadingToast(
                                message: 'Processing Data...');
                          });

                      var data = ProcessDoctorModel(
                          diagnose: diagnosa.text.toString(),
                          prescription: obat.text.toString());
                      await viewModel.processDoctor(
                          data: data, id: widget.idPatient);
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: viewModel.message,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.white,
                          textColor: kPrimaryColor);
                      Navigator.pop(context);
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
