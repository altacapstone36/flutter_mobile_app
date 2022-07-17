class AssignNurseModel {
  String? nurseCode;

  AssignNurseModel({required this.nurseCode});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nurse_code'] = nurseCode;
    return map;
  }
}

//model process doctor
class ProcessDoctorModel {
  ProcessDoctorModel({
    this.diagnose,
    this.prescription,
  });

  ProcessDoctorModel.fromJson(dynamic json) {
    diagnose = json['diagnose'];
    prescription = json['prescription'];
  }
  String? diagnose;
  String? prescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['diagnose'] = diagnose;
    map['prescription'] = prescription;
    return map;
  }
}

//model nurse
class ProcessNurseModel {
  ProcessNurseModel({
    this.bloodTension,
    this.height,
    this.weight,
    this.bodyTemp,
  });

  ProcessNurseModel.fromJson(dynamic json) {
    bloodTension = json['blood_tension'];
    height = json['height'];
    weight = json['weight'];
    bodyTemp = json['body_temp'];
  }
  int? bloodTension;
  int? height;
  int? weight;
  int? bodyTemp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['blood_tension'] = bloodTension;
    map['height'] = height;
    map['weight'] = weight;
    map['body_temp'] = bodyTemp;
    return map;
  }
}
