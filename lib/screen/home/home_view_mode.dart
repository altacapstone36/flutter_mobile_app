import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/api/auth.dart';
import 'package:hospital_management/model/user/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/error/error_model.dart';

class HomeViewModel with ChangeNotifier {
  String? message;
  Data dataUser = Data(
      id: 0,
      code: '-',
      email: '-',
      fullName: '------',
      gender: '-',
      roles: '-',
      facility: '-');

  Future<void> getUser() async {
    Data? userData;
    final userPref = await SharedPreferences.getInstance();
    var userString = userPref.getString('user');

    var userList = jsonDecode(userString!);
    userData = Data.fromJson(userList);
    debugPrint(userData.email);
    debugPrint(userData.fullName);
    dataUser = userData;

    notifyListeners();
  }

  Future<void> logOut() async {
    Jwt? token;
    final prefS = await SharedPreferences.getInstance();
    var tokenString = prefS.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);

      token = Jwt.fromJson(tokenList);
      debugPrint(token.accessToken);
      try {
        var response = await Auth().logOut(token.accessToken!);
        if (response.data != null) {
          message = response.data['message'].toString();
          debugPrint('message = ' + message.toString());
          prefS.remove('user');
          prefS.setBool('isLogin', false);
          //prefS.setBool('showLogin', false);
          prefS.remove('token');
          notifyListeners();
        }
      } on DioError catch (e) {
        if (e.response!.statusCode != 503) {
          ErrorModel error = ErrorModel.fromJson(e.response!.data);
          message = error.message.toString();
          message = 'User Logget Out';
          prefS.remove('user');
          prefS.setBool('isLogin', false);
          //prefS.setBool('showLogin', false);
          prefS.remove('token');
          notifyListeners();
        } else {
          message = e.response!.statusCode!.toString() + ' Service Unavailable';

          notifyListeners();
        }
        debugPrint(e.response!.data.toString());
        debugPrint(e.message.toString());
      }
    }
  }
}
