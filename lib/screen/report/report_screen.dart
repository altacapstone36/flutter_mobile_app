import 'package:flutter/material.dart';
import 'package:hospital_management/animation/fade_animation.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/report/report_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      Provider.of<ReportViewModel>(context, listen: false).getReport();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ReportViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Report Log',
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
      body: RefreshIndicator(
        onRefresh: () {
          return Provider.of<ReportViewModel>(context, listen: false)
              .getReport();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(child:
                  Consumer<ReportViewModel>(builder: (context, state, child) {
                if (state.state == DataState.loading) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        color: kSecondaryColor,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: ListTile(
                              title: Container(
                                  width: 50, height: 15, color: Colors.white)),
                        ),
                      );
                    },
                  );
                }
                if (state.state == DataState.error) {
                  return Center(
                    child: Text(viewModel.error!),
                  );
                }
                if (viewModel.report.isEmpty) {
                  return const Center(
                    child: Text('Report is empty'),
                  );
                }
                return ListView.builder(
                    itemCount: viewModel.report.length,
                    itemBuilder: (context, index) {
                      return FadeAnimation(
                        child: Card(
                          color: kSecondaryColor,
                          child: ListTile(
                            title: Text(
                                'Submitted Report for ${viewModel.report[index].serialNumber}'),
                          ),
                        ),
                      );
                    });
              }))
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedMenu: MenuState.other),
    );
  }
}
