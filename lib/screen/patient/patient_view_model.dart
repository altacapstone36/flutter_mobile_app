import 'package:flutter/cupertino.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/model/patient/patient_model.dart';

import '../../model/patient/medic_record_model.dart';

class PatientViewModel with ChangeNotifier {
  final List<PatientModel> patients = [
    PatientModel(
        waktu: '08:00',
        antri: 1,
        kode: 'RM0001',
        nik: 1231231,
        nama: 'Abi',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              id: 1,
              date: '01/06/2022',
              keluhan: 'Lapar',
              diagnosa: 'Kurang makan')
        ]),
    PatientModel(
        waktu: '08:20',
        antri: 2,
        kode: 'RM0002',
        nik: 1231231,
        nama: 'Aci',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              id: 1,
              date: '01/06/2022',
              keluhan: 'Lapar',
              diagnosa: 'Kurang makan')
        ]),
    PatientModel(
        waktu: '08:40',
        antri: 3,
        kode: 'RM0003',
        nik: 1231231,
        nama: 'Adi',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              id: 1,
              date: '01/06/2022',
              keluhan: 'Lapar',
              diagnosa: 'Kurang makan'),
          MedicRecord(
              id: 2,
              date: '01/06/2022',
              keluhan: 'Lapar',
              diagnosa: 'Kurang makan'),
        ]),
    PatientModel(
        waktu: '09:00',
        antri: 4,
        kode: 'RM0004',
        nik: 1231231,
        nama: 'Afi',
        jKel: 'Perempuan',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              id: 1,
              date: '01/06/2022',
              keluhan: 'Lapar',
              diagnosa: 'Kurang makan'),
          MedicRecord(
              id: 2,
              date: '01/06/2022',
              keluhan: 'Lapar',
              diagnosa: 'Kurang makan'),
        ]),
    PatientModel(
        waktu: '09:20',
        antri: 5,
        kode: 'RM0005',
        nik: 1231231,
        nama: 'Agi',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(id: 1, date: '01/06/2022', keluhan: 'Lapar', diagnosa: '')
        ]),
    PatientModel(
        waktu: '09:40',
        antri: 6,
        kode: 'RM0006',
        nik: 1231231,
        nama: 'Aji',
        jKel: 'Laki - laki',
        darah: 'O',
        medicRecord: [
          MedicRecord(
              id: 1, date: '01/06/2022', keluhan: 'Lapar', diagnosa: 'Makan'),
        ]),
  ];
  // List<PatientModel> get patients => _patients;
  final List<MedicRecord> _medic = [];
  List<MedicRecord> get medic => _medic;

  //state
  DataState _state = DataState.loading;
  DataState get state => _state;

  void changeState(DataState s) {
    _state = s;
    notifyListeners();
  }

  void addMedicRecord(MedicRecord medic, int id) {
    patients[id].medicRecord.add(medic);
    notifyListeners();
  }
}
