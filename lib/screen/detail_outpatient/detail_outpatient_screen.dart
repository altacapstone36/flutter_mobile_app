import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_management/components/bottom_nav_bar.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/screen/detail_outpatient/component/form_doctor.dart';
import 'package:hospital_management/screen/detail_outpatient/component/form_nurse.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../model/user/model_user_login.dart';
import '../outpatient/outpatient_view_model.dart';

class DetailOutpatient extends StatefulWidget {
  const DetailOutpatient(
      {Key? key,
      required this.idPasien,
      required this.idRecord,
      required this.waktu,
      required this.nama,
      required this.kode,
      required this.keluhan})
      : super(key: key);

  final String waktu, nama, kode, keluhan;
  final int idPasien, idRecord;

  @override
  State<DetailOutpatient> createState() => _DetailOutpatientState();
}

class _DetailOutpatientState extends State<DetailOutpatient> {
  String? roles;

  void checkRoles() async {
    var pref = await SharedPreferences.getInstance();
    var data = pref.getString('user');
    if (data != null) {
      var userDecode = jsonDecode(data);
      DataLogin userData = DataLogin.fromJson(userDecode);
      setState(() {
        roles = userData.roles;
      });
    }
  }

  @override
  void initState() {
    checkRoles();
    super.initState();
  }

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
      body: RefreshIndicator(
        onRefresh: () {
          return Provider.of<OutpatientViewModel>(context, listen: false)
              .getOutpatient();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13, 15, 13, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
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
                              child: Text(widget.waktu),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          widget.nama,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          widget.kode,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kSecondaryColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          widget.keluhan,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kSecondaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(children: [
                  roles == 'Doctor'
                      ? FormDoctor(idPatient: widget.idPasien)
                      : FormNurse(
                          idPatient: widget.idPasien,
                        )
                ])
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(selectedMenu: MenuState.outpatient),
    );
  }
}
