import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/api/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/error/error_model.dart';
import '../../model/user/model_user_login.dart';

class ChangePasswordViewModel with ChangeNotifier {
  String message = '';
  String token = '';

  Future<void> changePassword(String pass) async {
    Jwt? tokenModel;
    final pref = await SharedPreferences.getInstance();
    var tokenString = pref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      tokenModel = Jwt.fromJson(tokenList);
      try {
        var response =
            await Auth().changePassword(tokenModel.accessToken!, pass);
        message = response.data['message'].toString();
      } on DioError catch (e) {
        if (e.response!.statusCode == 503) {
          message = e.response!.statusCode.toString() + ' Service Unavailable';
        } else {
          message = e.response!.data.toString();
        }
      }
    }
  }

  Future<void> findEmail({required String email}) async {
    try {
      var response = await Auth().findEmail(email);
      if (response.statusCode == 200) {
        ModelUserLogin responseData = ModelUserLogin.fromJson(response.data);

        Jwt tokenModel = responseData.jwt!;
        token = tokenModel.accessToken!;

        message = responseData.message!;
        notifyListeners();
      }
    } on DioError catch (e) {
      if (e.response!.statusCode != 503) {
        ErrorModel error = ErrorModel.fromJson(e.response!.data);
        if (error.error == null) {
          message = 'Failed to Get Data';
          message = e.response!.data['message'].toString();
        } else {
          message = error.error!;
        }
      } else {
        message = e.response!.statusCode!.toString() + ' Service Unavailable';
        debugPrint(message);
        debugPrint(message);
        notifyListeners();
        debugPrint(e.message.toString());
      }
      debugPrint(e.message.toString());
    }
  }

  Future<void> forgotPass({required String pass}) async {
    try {
      var response = await Auth().forgotPassword(pass: pass, token: token);
      message = response.data['message'].toString();
    } on DioError catch (e) {
      if (e.response!.statusCode == 503) {
        message = e.response!.statusCode.toString() + ' Service Unavailable';
      } else {
        message = e.response!.data.toString();
      }
    }
  }
}
