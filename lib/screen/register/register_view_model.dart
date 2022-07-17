import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/api/auth.dart';
import 'package:hospital_management/model/user/register_model.dart';

class RegisterViewModel with ChangeNotifier {
  String message = '';

  Future<void> register(RegisterModel data) async {
    try {
      var response = await Auth().register(data: data);
      message = response.data['message'].toString();
    } on DioError catch (e) {
      message = e.response!.data;
    }
  }
}
