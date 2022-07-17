import 'package:flutter/material.dart';
import 'package:hospital_management/constants.dart';
import 'package:shimmer/shimmer.dart';

class CardPatientShimmer extends StatelessWidget {
  const CardPatientShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          color: kSecondaryColor,
          child: Shimmer.fromColors(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
              title: Container(height: 10, width: 50, color: Colors.white),
              subtitle: Container(
                width: 50,
                height: 10,
                color: Colors.white,
              ),
            ),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
          ),
        );
      },
    );
  }
}
