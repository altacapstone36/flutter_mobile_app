class PatientModel {
  String? kode, nama, jKel, darah;
  int? nik;
  List<MedicRecord> medicRecord;

  PatientModel(
      {required this.kode,
      required this.nik,
      required this.nama,
      required this.jKel,
      required this.darah,
      required this.medicRecord});
}

class MedicRecord {
  String? date, keluhan, diagnosa;
  MedicRecord(
      {required this.date, required this.keluhan, required this.diagnosa});
}
