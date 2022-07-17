class RegisterModel {
  RegisterModel({
    this.email,
    this.password,
    this.facilityId,
    this.fullName,
    this.gender,
    this.roleId,
  });

  String? email;
  String? password;
  int? facilityId;
  String? fullName;
  String? gender;
  int? roleId;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "facility_id": facilityId,
        "full_name": fullName,
        "gender": gender,
        "role_id": roleId,
      };
}
