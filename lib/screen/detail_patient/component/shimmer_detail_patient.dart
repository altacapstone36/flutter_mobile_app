import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants.dart';

class ShimmerDetailPatient extends StatelessWidget {
  const ShimmerDetailPatient({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 15,
                      width: size.width,
                      color: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 15,
                    width: size.width,
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 15,
                      width: size.width,
                      color: Colors.white,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 15,
                      width: size.width,
                      color: Colors.white,
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 15,
                      width: size.width,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Medic Record (Scroll Arround)',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kPrimaryColor),
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
                // ...viewModel.medicRecord.map((e) => DataRow(cells: [
                //       DataCell(Text(id.toString())),
                //       DataCell(Text(e.dateCheck!)),
                //       DataCell(Text(e.complaint!)),
                //       DataCell(Text(e.diagnose!)),
                //     ]))
              ]),
        )
      ],
    );
  }
}
