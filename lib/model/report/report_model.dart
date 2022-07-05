class ReportModel {
  ReportModel({
    this.message,
    this.data,
  });

  ReportModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataReport.fromJson(v));
      });
    }
  }
  String? message;
  List<DataReport>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataReport {
  DataReport({
    this.serialNumber,
  });

  DataReport.fromJson(dynamic json) {
    serialNumber = json['serial_number'];
  }
  String? serialNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serial_number'] = serialNumber;
    return map;
  }
}

// class ReportModel {
//   String? kode;
//   ReportModel({required this.kode});
// }
