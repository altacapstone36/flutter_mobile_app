class PatientByidModels {
  PatientByidModels({
    this.message,
    this.data,
  });

  PatientByidModels.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? PatientDataId.fromJson(json['data']) : null;
  }
  String? message;
  PatientDataId? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class PatientDataId {
  PatientDataId({
    this.id,
    this.code,
    this.nationalId,
    this.fullName,
    this.address,
    this.gender,
    this.birthdate,
    this.bloodType,
    this.medicRecord,
  });

  PatientDataId.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    nationalId = json['national_id'];
    fullName = json['full_name'];
    address = json['address'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    bloodType = json['blood_type'];
    if (json['medic_record'] != null) {
      medicRecord = [];
      json['medic_record'].forEach((v) {
        medicRecord?.add(MedicRecord.fromJson(v));
      });
    }
  }
  int? id;
  String? code;
  String? nationalId;
  String? fullName;
  String? address;
  String? gender;
  String? birthdate;
  String? bloodType;
  List<MedicRecord>? medicRecord;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['national_id'] = nationalId;
    map['full_name'] = fullName;
    map['address'] = address;
    map['gender'] = gender;
    map['birthdate'] = birthdate;
    map['blood_type'] = bloodType;
    if (medicRecord != null) {
      map['medic_record'] = medicRecord?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class MedicRecord {
  MedicRecord({
    this.serialNumber,
    this.complaint,
    this.diagnose,
    this.prescription,
    this.doctor,
    this.facility,
    this.dateCheck,
    this.medicCheck,
  });

  MedicRecord.fromJson(dynamic json) {
    serialNumber = json['serial_number'];
    complaint = json['complaint'];
    diagnose = json['diagnose'];
    prescription = json['prescription'];
    doctor = json['doctor'];
    facility = json['facility'];
    dateCheck = json['date_check'];
    medicCheck = json['medic_check'] != null
        ? MedicCheck.fromJson(json['medic_check'])
        : null;
  }
  String? serialNumber;
  String? complaint;
  String? diagnose;
  String? prescription;
  String? doctor;
  String? facility;
  String? dateCheck;
  MedicCheck? medicCheck;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serial_number'] = serialNumber;
    map['complaint'] = complaint;
    map['diagnose'] = diagnose;
    map['prescription'] = prescription;
    map['doctor'] = doctor;
    map['facility'] = facility;
    map['date_check'] = dateCheck;
    if (medicCheck != null) {
      map['medic_check'] = medicCheck?.toJson();
    }
    return map;
  }
}

class MedicCheck {
  MedicCheck({
    this.bloodTension,
    this.height,
    this.weight,
    this.bodyTemp,
    this.nurse,
  });

  MedicCheck.fromJson(dynamic json) {
    bloodTension = json['blood_tension'];
    height = json['height'];
    weight = json['weight'];
    bodyTemp = json['body_temp'];
    nurse = json['nurse'];
  }
  int? bloodTension;
  int? height;
  int? weight;
  int? bodyTemp;
  String? nurse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['blood_tension'] = bloodTension;
    map['height'] = height;
    map['weight'] = weight;
    map['body_temp'] = bodyTemp;
    map['nurse'] = nurse;
    return map;
  }
}
