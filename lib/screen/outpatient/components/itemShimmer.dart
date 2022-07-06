import 'package:flutter/material.dart';
import 'package:hospital_management/components/item_card_shimmer.dart';

class ItemShimmer extends StatelessWidget {
  const ItemShimmer({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          return ItemCardShimmer(size: size);
        });
  }
}
