import 'dart:convert';

ErrorSubmitModel errorSubmitModelFromJson(String str) =>
    ErrorSubmitModel.fromJson(json.decode(str));

String errorSubmitModelToJson(ErrorSubmitModel data) =>
    json.encode(data.toJson());

class ErrorSubmitModel {
  ErrorSubmitModel({
    this.error,
    this.message,
  });

  Error? error;
  String? message;

  factory ErrorSubmitModel.fromJson(Map<String, dynamic> json) =>
      ErrorSubmitModel(
        error: Error.fromJson(json["error"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error!.toJson(),
        "message": message,
      };
}

class Error {
  Error({
    this.id,
  });

  String? id;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        id: json["ID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
      };
}
