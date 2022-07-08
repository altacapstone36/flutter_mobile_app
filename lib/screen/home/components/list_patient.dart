import 'package:flutter/material.dart';
import 'package:hospital_management/animation/fade_animation.dart';
import 'package:hospital_management/components/item_card.dart';
import 'package:hospital_management/components/item_card_shimmer.dart';
import 'package:hospital_management/components/no_outpatient_card.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/outpatient/outpatient_view_model.dart';
import 'package:provider/provider.dart';

import '../../../enums.dart';
import '../../detail_outpatient/detail_outpatient_screen.dart';

class PatientList extends StatefulWidget {
  const PatientList({Key? key}) : super(key: key);

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<OutpatientViewModel>(context, listen: false).getOutpatient();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final viewModel = Provider.of<OutpatientViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 13, top: 25, right: 16),
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
          Consumer<OutpatientViewModel>(
            builder: (context, state, child) {
              if (state.stateType == DataState.error) {
                return NoOutpatientCard(size: size);
              } else if (state.stateType == DataState.loading) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          20,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: ItemCardShimmer(size: size),
                              ))
                    ],
                  ),
                );
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    ...List.generate(
                        viewModel.outpatients.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: FadeAnimation(
                                child: ItemCard(
                                    size: size,
                                    waktu: viewModel.outpatients[index].session!
                                        .toString(),
                                    nama:
                                        viewModel.outpatients[index].fullName!,
                                    antrian: viewModel.outpatients[index].queue!
                                        .toString(),
                                    kode: viewModel
                                        .outpatients[index].patientCode!,
                                    keluhan:
                                        viewModel.outpatients[index].complaint!,
                                    onTap: () {
                                      int id = viewModel.outpatients.length;
                                      Navigator.of(context).push(
                                          PageRouteBuilder(pageBuilder:
                                              (context, animation,
                                                  secondaryAnimation) {
                                        return DetailOutpatient(
                                          idPasien: index,
                                          idRecord: id,
                                          waktu: viewModel
                                              .outpatients[index].session!
                                              .toString(),
                                          nama: viewModel
                                              .outpatients[index].fullName!,
                                          kode: viewModel
                                              .outpatients[index].patientCode!,
                                          keluhan: viewModel
                                              .outpatients[index].complaint!,
                                        );
                                      }, transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                        final tween =
                                            Tween(begin: 0.0, end: 2.0);
                                        return FadeTransition(
                                          opacity: animation.drive(tween),
                                          child: child,
                                        );
                                      }));
                                    }),
                              ),
                            ))
                  ]),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
