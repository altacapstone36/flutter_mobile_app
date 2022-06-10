import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';

import '../../constants.dart';

class DetailOutpatient extends StatelessWidget {
  const DetailOutpatient(
      {Key? key,
      required this.waktu,
      required this.nama,
      required this.kode,
      required this.keluhan})
      : super(key: key);

  final String waktu, nama, kode, keluhan;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Outpatient',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(13, 15, 13, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.19,
                width: size.width,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(13, 13, 13, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                            child: Text(waktu),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        nama,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kSecondaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        kode,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: kSecondaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        keluhan,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: kSecondaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 70.0, bottom: 10),
                child: Text('Diagnosis',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor)),
              ),
              TextField(
                minLines: 4,
                maxLines: 6,
                decoration: InputDecoration(
                    hintText: 'Tuliskan hasil diagnosa disini....',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text('Medical Prescription',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor)),
              ),
              TextField(
                minLines: 4,
                maxLines: 6,
                decoration: InputDecoration(
                    hintText: 'Tuliskan resep disini...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                      child: const Text('COMPLETE')),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(selectedMenu: MenuState.outpatient),
    );
  }
}
