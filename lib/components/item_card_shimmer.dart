import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants.dart';

class ItemCardShimmer extends StatelessWidget {
  const ItemCardShimmer({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.height * 0.19,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 2,
                  offset: const Offset(0, 0.5))
            ]),
        padding: const EdgeInsets.all(10),
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        width: size.width * 0.12,
                        height: 20,
                        color: Colors.white)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      height: 19,
                      width: size.width * 0.18,
                      color: Colors.white,
                    )),
                Container(
                    height: 15, width: size.width * 0.18, color: Colors.white),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    height: 15, width: size.width * 0.18, color: Colors.white),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    height: 15, width: size.width * 0.18, color: Colors.white),
                const SizedBox(
                  height: 5,
                )
              ],
            )));
  }
}
