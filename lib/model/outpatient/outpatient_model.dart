class OutpatientModel {
  OutpatientModel({
    this.message,
    this.data,
  });

  OutpatientModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(OutpatientData.fromJson(v));
      });
    }
  }
  String? message;
  List<OutpatientData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class OutpatientData {
  OutpatientData({
    this.id,
    this.serialNumber,
    this.fullName,
    this.patientCode,
    this.complaint,
    this.doctor,
    this.session,
    this.dateCheck,
    this.queue,
  });

  OutpatientData.fromJson(dynamic json) {
    id = json['id'];
    serialNumber = json['serial_number'];
    fullName = json['full_name'];
    patientCode = json['patient_code'];
    complaint = json['complaint'];
    doctor = json['doctor'];
    session = json['session'];
    dateCheck = json['date_check'];
    queue = json['queue'];
  }
  int? id;
  String? serialNumber;
  String? fullName;
  String? patientCode;
  String? complaint;
  String? doctor;
  String? session;
  String? dateCheck;
  int? queue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['serial_number'] = serialNumber;
    map['full_name'] = fullName;
    map['patient_code'] = patientCode;
    map['complaint'] = complaint;
    map['doctor'] = doctor;
    map['session'] = session;
    map['date_check'] = dateCheck;
    map['queue'] = queue;
    return map;
  }
}
