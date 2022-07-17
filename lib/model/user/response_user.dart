class ResponseUser {
  ResponseUser({
    this.message,
    this.data,
  });

  ResponseUser.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AllDataUser.fromJson(v));
      });
    }
  }
  String? message;
  List<AllDataUser>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AllDataUser {
  AllDataUser({
    this.id,
    this.code,
    this.email,
    this.fullName,
    this.gender,
    this.roles,
    this.facility,
    this.status,
  });

  AllDataUser.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    email = json['email'];
    fullName = json['full_name'];
    gender = json['gender'];
    roles = json['roles'];
    facility = json['facility'];
    status = json['status'];
  }
  int? id;
  String? code;
  String? email;
  String? fullName;
  String? gender;
  String? roles;
  String? facility;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['email'] = email;
    map['full_name'] = fullName;
    map['gender'] = gender;
    map['roles'] = roles;
    map['facility'] = facility;
    map['status'] = status;
    return map;
  }
}
