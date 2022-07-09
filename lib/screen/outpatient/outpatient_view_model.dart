import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/api/outpatient_api.dart';
import 'package:hospital_management/model/outpatient/outpatient_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums.dart';
import '../../model/error/error_model.dart';
import '../../model/user/model_user_login.dart';

class OutpatientViewModel with ChangeNotifier {
  List<OutpatientData> _outpatients = [];
  List<OutpatientData> get outpatients => _outpatients;

  String? eror;
  String? message;

  DataState _stateType = DataState.loading;
  DataState get stateType => _stateType;

  void changeState(DataState s) {
    _stateType = s;
    notifyListeners();
  }

  Future<void> getOutpatient() async {
    changeState(DataState.loading);

    Jwt? tokenModel;
    final pref = await SharedPreferences.getInstance();
    var tokenString = pref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      tokenModel = Jwt.fromJson(tokenList);
      try {
        changeState(DataState.loading);

        var response =
            await OutpatientApi().getOutpatient(tokenModel.accessToken!);
        if (response.statusCode == 200) {
          OutpatientModel responseData =
              OutpatientModel.fromJson(response.data);
          List<OutpatientData>? outpatientList = responseData.data;
          _outpatients = outpatientList!;
          notifyListeners();
          debugPrint(outpatients[1].toString());
          debugPrint(outpatientList.toString());
          changeState(DataState.succes);
        }
      } on DioError catch (e) {
        debugPrint(e.message.toString());
        changeState(DataState.error);
        if (e.response!.data == null) {
          eror = 'Failed to Get Data';
        }
        if (e.response!.statusCode != 503) {
          eror = e.response!.data.toString();
          ErrorModel error = ErrorModel.fromJson(e.response!.data);
          eror = error.error;
          debugPrint(eror);
          debugPrint(e.response!.statusCode.toString());
        } else {
          eror = e.response!.statusCode!.toString() + ' Service Unavailable';
          debugPrint(e.message.toString());
        }
        notifyListeners();
      }
    }
  }
}
