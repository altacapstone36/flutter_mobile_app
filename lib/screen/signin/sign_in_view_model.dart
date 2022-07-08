import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/api/auth.dart';
import 'package:hospital_management/model/error/error_model.dart';
import 'package:hospital_management/model/user/model_user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums.dart';

class SignInViewModel with ChangeNotifier {
  DataLogin? dataUser;
  Jwt? token;
  String? eror;

  DataState _stateType = DataState.loading;
  DataState get stateType => _stateType;

  void changeState(DataState s) {
    _stateType = s;
    notifyListeners();
  }

  Future<void> signIn({required String email, required String pass}) async {
    changeState(DataState.loading);

    try {
      changeState(DataState.loading);

      var responseData = await Auth().login(email: email, password: pass);
      if (responseData.statusCode == 200) {
        ModelUserLogin modelUser = ModelUserLogin.fromJson(responseData.data);
        final prefs = await SharedPreferences.getInstance();

        dataUser = modelUser.data;
        token = modelUser.jwt;

        var encodeUser = jsonEncode(dataUser);
        var encodeToken = jsonEncode(token);

        await prefs.setString('token', encodeToken);
        await prefs.setString('user', encodeUser);
        await prefs.setBool('isLogin', true);

        notifyListeners();
        changeState(DataState.succes);
      }
    } on DioError catch (e) {
      changeState(DataState.error);
      if (e.response!.statusCode != 503) {
        ErrorModel error = ErrorModel.fromJson(e.response!.data);
        eror = error.error;
      } else {
        eror = e.response!.statusCode!.toString() + ' Service Unavailable';
        print(eror);
        print(e.message.toString());
      }
      //print(e.response!.data.toString());
      // debugPrint(error.error.toString());
      notifyListeners();
    }
  }

  Future<Jwt?>? getToken() async {
    Jwt? tokenData;
    final tokenPref = await SharedPreferences.getInstance();
    var tokenString = tokenPref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      //token = tokenList;
      tokenData = Jwt.fromJson(tokenList);
      debugPrint(tokenData.accessToken);
      return tokenData;
    }
    notifyListeners();
    return tokenData;
  }
}
