class OutpatientModel {
  String? waktu, nama, antrian, kode, keluhan;

  OutpatientModel(
      {required this.waktu,
      required this.nama,
      required this.antrian,
      required this.kode,
      required this.keluhan});
}

final List<OutpatientModel> outpatientList = [
  OutpatientModel(
      waktu: '08:00',
      nama: 'Abi',
      antrian: '1',
      kode: 'RM001',
      keluhan: 'Lapar'),
  OutpatientModel(
      waktu: '08:20',
      nama: 'Aci',
      antrian: '2',
      kode: 'RM002',
      keluhan: 'Haus'),
  OutpatientModel(
      waktu: '08:40',
      nama: 'Adi',
      antrian: '3',
      kode: 'RM003',
      keluhan: 'Gerah'),
  OutpatientModel(
      waktu: '09:00',
      nama: 'Afi',
      antrian: '4',
      kode: 'RM004',
      keluhan: 'Panas Dalam'),
  OutpatientModel(
      waktu: '09:20',
      nama: 'Agi',
      antrian: '5',
      kode: 'RM005',
      keluhan: 'Gelisah'),
  OutpatientModel(
      waktu: '09:40',
      nama: 'Ahi',
      antrian: '6',
      kode: 'RM006',
      keluhan: 'Lapar'),
  OutpatientModel(
      waktu: '10:00',
      nama: 'Aji',
      antrian: '7',
      kode: 'RM007',
      keluhan: 'Lapar'),
  OutpatientModel(
      waktu: '10:20',
      nama: 'Aki',
      antrian: '8',
      kode: 'RM008',
      keluhan: 'Lapar'),
  OutpatientModel(
      waktu: '10:40',
      nama: 'Ali',
      antrian: '9',
      kode: 'RM009',
      keluhan: 'Lapar'),
];
