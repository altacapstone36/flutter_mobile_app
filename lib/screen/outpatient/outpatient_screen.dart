import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/components/item_card.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/outpatient/outpatient_view_model.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../detail_outpatient/detail_outpatient_screen.dart';
import 'components/itemShimmer.dart';

class OutpatientScreen extends StatefulWidget {
  const OutpatientScreen({Key? key, required this.showBack}) : super(key: key);

  final bool showBack;

  @override
  State<OutpatientScreen> createState() => _OutpatientScreenState();
}

class _OutpatientScreenState extends State<OutpatientScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<OutpatientViewModel>(context, listen: false).getOutpatient();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OutpatientViewModel>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Outpatient',
          style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
        ),
        leading: widget.showBack
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor))
            : null,
        centerTitle: true,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Provider.of<OutpatientViewModel>(context, listen: false)
              .getOutpatient();
        },
        child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
            child:
                Consumer<OutpatientViewModel>(builder: (context, state, child) {
              if (state.stateType == DataState.loading) {
                return ItemShimmer(size: size);
              } else if (state.stateType == DataState.error) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          (viewModel.eror == null)
                              ? 'Failed to Get Data'
                              : viewModel.eror!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => Provider.of<OutpatientViewModel>(
                                    context,
                                    listen: false)
                                .getOutpatient(),
                            style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor),
                            child: const Text('Refresh'))
                      ]),
                );
              } else {
                return GridView.builder(
                    itemCount: viewModel.outpatients.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return ItemCard(
                          size: size,
                          waktu:
                              viewModel.outpatients[index].session!.toString(),
                          nama: viewModel.outpatients[index].fullName!,
                          antrian:
                              viewModel.outpatients[index].queue!.toString(),
                          kode: viewModel.outpatients[index].patientCode!,
                          keluhan: viewModel.outpatients[index].complaint!,
                          onTap: () {
                            int id = viewModel.outpatients.length;
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                              return DetailOutpatient(
                                idPasien: viewModel.outpatients[index].id!,
                                idRecord: id,
                                waktu: viewModel.outpatients[index].session!
                                    .toString(),
                                nama: viewModel.outpatients[index].fullName!,
                                kode: viewModel.outpatients[index].patientCode!,
                                keluhan:
                                    viewModel.outpatients[index].complaint!,
                              );
                            }, transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                              final tween = Tween(begin: 0.0, end: 2.0);
                              return FadeTransition(
                                opacity: animation.drive(tween),
                                child: child,
                              );
                            }));
                          });
                    });
              }
            })),
      ),
      bottomNavigationBar:
          const BottomNavBar(selectedMenu: MenuState.outpatient),
    );
  }
}
