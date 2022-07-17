import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/api/patient_api.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/model/patient/patient_models.dart';
import 'package:hospital_management/model/user/model_user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/error/error_model.dart';

class PatientViewModel with ChangeNotifier {
  List<PatientData> _patients = [];
  List<PatientData> get patients => _patients;

  List<PatientData> patientByName = [];
  String? eror;

  DataState _state = DataState.loading;
  DataState get state => _state;

  void changeState(DataState s) {
    _state = s;
    notifyListeners();
  }

  Future<void> getPatient() async {
    changeState(DataState.loading);
    Jwt? tokenModel;
    final pref = await SharedPreferences.getInstance();
    var tokenString = pref.getString('token');
    if (tokenString != null) {
      var tokenList = jsonDecode(tokenString);
      tokenModel = Jwt.fromJson(tokenList);

      try {
        changeState(DataState.loading);
        var response = await PatientApi().patient(tokenModel.accessToken!);
        if (response.statusCode == 200) {
          PatientModel responseData = PatientModel.fromJson(response.data);
          List<PatientData>? patientList = responseData.data;
          _patients = patientList!;
          debugPrint(patientList[1].birthdate.toString());
          notifyListeners();
          changeState(DataState.succes);
        }
      } on DioError catch (e) {
        changeState(DataState.error);
        if (e.response!.statusCode != 503) {
          ErrorModel error = ErrorModel.fromJson(e.response!.data);
          eror = error.error;
          debugPrint(eror);
        } else {
          eror = e.response!.statusCode!.toString() + ' Service Unavailable';
          debugPrint(e.message.toString());
        }
        notifyListeners();
      }
    }
  }

  void searchPatient(String query) {
    patientByName.clear();
    if (query.isEmpty || query == '') {
      return;
    } else {
      _patients.forEach((e) {
        if (e.fullName!.toLowerCase().contains(query.toLowerCase())) {
          patientByName.add(e);
          notifyListeners();
        }
      });
    }
  }
}
