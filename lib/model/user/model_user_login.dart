class ModelUserLogin {
  ModelUserLogin({
    String? message,
    DataLogin? data,
    Jwt? jwt,
  }) {
    _message = message;
    _data = data;
    _jwt = jwt;
  }

  ModelUserLogin.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
    _jwt = json['jwt'] != null ? Jwt.fromJson(json['jwt']) : null;
  }
  String? _message;
  DataLogin? _data;
  Jwt? _jwt;
  ModelUserLogin copyWith({
    String? message,
    DataLogin? data,
    Jwt? jwt,
  }) =>
      ModelUserLogin(
        message: message ?? _message,
        data: data ?? _data,
        jwt: jwt ?? _jwt,
      );
  String? get message => _message;
  DataLogin? get data => _data;
  Jwt? get jwt => _jwt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_jwt != null) {
      map['jwt'] = _jwt?.toJson();
    }
    return map;
  }
}

//token
class Jwt {
  Jwt({
    String? accessToken,
    String? refreshToken,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  Jwt.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  String? _accessToken;
  String? _refreshToken;
  Jwt copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      Jwt(
        accessToken: accessToken ?? _accessToken,
        refreshToken: refreshToken ?? _refreshToken,
      );
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }
}

class DataLogin {
  DataLogin({
    int? id,
    String? code,
    String? email,
    String? fullName,
    String? gender,
    String? roles,
    String? facility,
  }) {
    _id = id;
    _code = code;
    _email = email;
    _fullName = fullName;
    _gender = gender;
    _roles = roles;
    _facility = facility;
  }

  DataLogin.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _email = json['email'];
    _fullName = json['full_name'];
    _gender = json['gender'];
    _roles = json['roles'];
    _facility = json['facility'];
  }
  int? _id;
  String? _code;
  String? _email;
  String? _fullName;
  String? _gender;
  String? _roles;
  String? _facility;

  DataLogin copyWith({
    int? id,
    String? code,
    String? email,
    String? fullName,
    String? gender,
    String? roles,
    String? facility,
  }) =>
      DataLogin(
        id: id ?? _id,
        code: code ?? _code,
        email: email ?? _email,
        fullName: fullName ?? _fullName,
        gender: gender ?? _gender,
        roles: roles ?? _roles,
        facility: facility ?? _facility,
      );
  int? get id => _id;
  String? get code => _code;
  String? get email => _email;
  String? get fullName => _fullName;
  String? get gender => _gender;
  String? get roles => _roles;
  String? get facility => _facility;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['email'] = _email;
    map['full_name'] = _fullName;
    map['gender'] = _gender;
    map['roles'] = _roles;
    map['facility'] = _facility;
    return map;
  }
}
