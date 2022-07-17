import 'dart:convert';

PatientModel patientModelFromJson(String str) =>
    PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
  PatientModel({
    this.message,
    this.data,
  });

  String? message;
  List<PatientData>? data;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        message: json["message"],
        data: List<PatientData>.from(
            json["data"].map((x) => PatientData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PatientData {
  PatientData({
    this.id,
    this.code,
    this.nationalId,
    this.fullName,
    this.gender,
    this.birthdate,
  });

  int? id;
  String? code;
  String? nationalId;
  String? fullName;
  String? gender;
  String? birthdate;

  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
        id: json["id"],
        code: json["code"],
        nationalId: json["national_id"],
        fullName: json["full_name"],
        gender: json["gender"],
        birthdate: json["birthdate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "national_id": nationalId,
        "full_name": fullName,
        "gender": gender,
        "birthdate": birthdate,
      };
}
