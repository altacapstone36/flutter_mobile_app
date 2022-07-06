import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/constants.dart';

class NoOutpatientCard extends StatelessWidget {
  const NoOutpatientCard({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      // color: kPrimaryColor,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kPrimaryColor),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "There's no outpatient for now",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 30),
                  child: SizedBox(
                    height: size.height * 0.13,
                    width: size.width * 0.35,
                    child: const Center(
                      child: Text(
                        "0 Patient's\nAppointment",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: size.height * 0.14,
                    width: size.width * 0.35,
                    child: SvgPicture.asset('assets/images/no_outpatient.svg'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
