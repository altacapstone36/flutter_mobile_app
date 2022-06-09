import 'package:flutter/material.dart';
import 'package:hospital_management/components/item_card.dart';

class OutpatientData extends StatelessWidget {
  const OutpatientData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GridView.builder(
        itemCount: 7,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          return ItemCard(
              size: size,
              waktu: '08:30',
              nama: 'Zuli',
              antrian: '2',
              kode: 'RM002',
              keluhan: 'Sakit gigi',
              onTap: () {});
        },
      ),
    );
  }
}
