import 'medic_record_model.dart';

class PatientModel {
  String? kode, nama, jKel, darah, waktu;
  int? nik, antri;
  List<MedicRecord> medicRecord;

  PatientModel(
      {required this.waktu,
      required this.antri,
      required this.kode,
      required this.nik,
      required this.nama,
      required this.jKel,
      required this.darah,
      required this.medicRecord});
}
