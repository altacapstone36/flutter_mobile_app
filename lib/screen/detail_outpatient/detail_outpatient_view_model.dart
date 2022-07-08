import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/model/error/error_submit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/outpatient_api.dart';
import '../../enums.dart';
import '../../model/error/error_model.dart';
import '../../model/outpatient/process_model.dart';
import '../../model/user/model_user_login.dart';
import '../../model/user/response_user.dart';

class DetailOutpatientViewModel with ChangeNotifier {
  List<AllDataUser> _nurse = [];
  List<AllDataUser> get nurse => _nurse;

  String message = '';
  bool isSelected = false;
  bool selectedItem = false;

  DataState _stateType = DataState.loading;
  DataState get stateType => _stateType;

  void changeState(DataState s) {
    _stateType = s;
    notifyListeners();
  }

  Future<void> getNurse() async {
    changeState(DataState.loading);

    Jwt? tokenModel;
    final pref = await SharedPreferences.getInstance();
    var tokenString = pref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      tokenModel = Jwt.fromJson(tokenList);

      try {
        changeState(DataState.loading);

        var response = await OutpatientApi().getNurse(tokenModel.accessToken!);
        if (response.statusCode == 200) {
          ResponseUser userData = ResponseUser.fromJson(response.data);
          List<AllDataUser> userList = userData.data!;
          debugPrint(response.data.toString());
          _nurse = userList;
          notifyListeners();
          changeState(DataState.succes);
          debugPrint(userData.toString());
        }
      } on DioError catch (e) {
        changeState(DataState.error);
        if (e.response!.statusCode != 503) {
          ErrorModel error = ErrorModel.fromJson(e.response!.data);
          message = error.error!;
          debugPrint(message);
        } else {
          message = e.response!.statusCode!.toString() + ' Service Unavailable';
          debugPrint(e.message.toString());
        }
        notifyListeners();
      }
    }
  }

  Future<void> assignNurse(AssignNurseModel nurseData, int id) async {
    changeState(DataState.idle);
    Jwt? tokenModel;
    final pref = await SharedPreferences.getInstance();
    var tokenString = pref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      tokenModel = Jwt.fromJson(tokenList);

      try {
        changeState(DataState.loading);
        var response = await OutpatientApi()
            .assignNurse(tokenModel.accessToken!, id, nurseData);
        if (response.statusCode == 201) {
          message = 'Succes';
          debugPrint(response.data.toString());
          changeState(DataState.succes);
          notifyListeners();
        }
      } on DioError catch (e) {
        changeState(DataState.error);

        if (e.response!.statusCode != 503) {
          message = 'Succes';
          debugPrint(e.response!.data.toString());
          debugPrint(e.message.toString());
          debugPrint(e.response!.data.toString());
          notifyListeners();
        } else {
          message = e.response!.statusCode!.toString() + ' Service Unavailable';
          debugPrint(e.message.toString());
          notifyListeners();
        }
      }
    }
  }

  Future<void> processDoctor(
      {required ProcessDoctorModel data, required int id}) async {
    changeState(DataState.loading);

    Jwt? tokenModel;
    final pref = await SharedPreferences.getInstance();
    var tokenString = pref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      tokenModel = Jwt.fromJson(tokenList);

      try {
        changeState(DataState.loading);
        var response = await OutpatientApi()
            .processDoctor(id, tokenModel.accessToken!, data);

        if (response.statusCode == 201) {
          message = response.data['message'].toString();
          debugPrint(response.data.toString());
          changeState(DataState.succes);
          notifyListeners();
        }
      } on DioError catch (e) {
        changeState(DataState.error);
        if (e.response!.statusCode == 400) {
          message = 'Medic Record Already Sumbitted';
        } else if (e.response!.statusCode == 407) {
          ErrorSubmitModel error = ErrorSubmitModel.fromJson(e.response!.data);
          message = error.message!;

          debugPrint(e.response!.statusCode!.toString());
          debugPrint(e.message);
          debugPrint(e.response!.data.toString());
          notifyListeners();
        } else {
          message = e.response!.statusCode!.toString() + ' Service Unavailable';
          debugPrint(e.message.toString());
          notifyListeners();
        }
      }
    }
  }

  Future<void> processNurse(
      {required ProcessNurseModel data, required int id}) async {
    changeState(DataState.loading);

    Jwt? tokenModel;
    final pref = await SharedPreferences.getInstance();
    var tokenString = pref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      tokenModel = Jwt.fromJson(tokenList);

      try {
        changeState(DataState.loading);
        var response = await OutpatientApi()
            .processNurse(id, tokenModel.accessToken!, data);

        if (response.statusCode == 201) {
          message = response.data['message'].toString();
          changeState(DataState.succes);
          notifyListeners();
        }
      } on DioError catch (e) {
        changeState(DataState.error);
        if (e.response!.statusCode == 400) {
          message = 'Patient hasbeen submitted';
        } else if (e.response!.statusCode == 407) {
          ErrorSubmitModel error = ErrorSubmitModel.fromJson(e.response!.data);
          message = error.error!.id!;

          debugPrint(message);
          debugPrint(e.message);
          debugPrint(e.response!.data.toString());
          notifyListeners();
        } else {
          message = e.response!.statusCode!.toString() + ' Service Unavailable';
          debugPrint(e.message.toString());
          notifyListeners();
        }
      }
    }
  }
}
