import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/api/report_api.dart';
import 'package:hospital_management/model/report/report_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums.dart';
import '../../model/error/error_model.dart';
import '../../model/user/model_user.dart';

class ReportViewModel with ChangeNotifier {
  List<DataReport> _report = [];
  List<DataReport> get report => _report;
  String? error;

  DataState _state = DataState.loading;
  DataState get state => _state;

  void changeState(DataState s) {
    _state = s;
    notifyListeners();
  }

  Future<void> getReport() async {
    changeState(DataState.loading);

    Jwt? tokenModel;
    final pref = await SharedPreferences.getInstance();
    var tokenString = pref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      tokenModel = Jwt.fromJson(tokenList);

      try {
        changeState(DataState.loading);

        var response = await ReportApi().report(tokenModel.accessToken!);
        if (response.statusCode == 200) {
          ReportModel responseReport = ReportModel.fromJson(response.data);
          List<DataReport> reportList = responseReport.data!;
          _report = reportList;
          notifyListeners();
          changeState(DataState.succes);
        }
      } on DioError catch (e) {
        changeState(DataState.error);
        if (e.response!.statusCode != 503) {
          ErrorModel errorData = ErrorModel.fromJson(e.response!.data);
          error = errorData.error;
          debugPrint(error);
        } else {
          error = e.response!.statusCode!.toString() + ' Service Unavailable';
          debugPrint(e.message.toString());
        }
        notifyListeners();
      }
    }
    // try {
    //   _report.add(report);
    //   notifyListeners();
    //   changeState(DataState.succes);
    // } catch (e) {
    //   print(e.toString());
    //   changeState(DataState.error);
    // }
  }
}
