import 'package:flutter/cupertino.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/model/patient/patient_model.dart';

class PatientViewModel with ChangeNotifier {
  final List<PatientModel> _patients = [
    PatientModel(
        kode: 'RM0001',
        nik: 1231231,
        nama: 'Abi',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              date: '01/06/2022', keluhan: 'Lapar', diagnosa: 'Kurang makan')
        ]),
    PatientModel(
        kode: 'RM0002',
        nik: 1231231,
        nama: 'Aci',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              date: '01/06/2022', keluhan: 'Lapar', diagnosa: 'Kurang makan')
        ]),
    PatientModel(
        kode: 'RM0003',
        nik: 1231231,
        nama: 'Adi',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              date: '01/06/2022', keluhan: 'Lapar', diagnosa: 'Kurang makan')
        ]),
    PatientModel(
        kode: 'RM0004',
        nik: 1231231,
        nama: 'Afi',
        jKel: 'Perempuan',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              date: '01/06/2022', keluhan: 'Lapar', diagnosa: 'Kurang makan')
        ]),
    PatientModel(
        kode: 'RM0005',
        nik: 1231231,
        nama: 'Agi',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              date: '01/06/2022', keluhan: 'Lapar', diagnosa: 'Kurang makan')
        ]),
    PatientModel(
        kode: 'RM0006',
        nik: 1231231,
        nama: 'Aji',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              date: '01/06/2022', keluhan: 'Lapar', diagnosa: 'Kurang makan')
        ]),
  ];
  List<PatientModel> get patients => _patients;

  //state
  DataState _state = DataState.loading;
  DataState get state => _state;

  void changeState(DataState s) {
    _state = s;
    notifyListeners();
  }

  //load patient data

}
