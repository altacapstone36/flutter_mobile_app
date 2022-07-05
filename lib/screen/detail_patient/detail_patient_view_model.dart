import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management/api/patient_api.dart';
import 'package:hospital_management/model/patient/patient_byid_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums.dart';
import '../../model/error/error_model.dart';
import '../../model/user/model_user.dart';

class DetailPatientViewModel with ChangeNotifier {
  PatientDataId patientDataId = PatientDataId();
  List<MedicRecord> medicRecord = [];
  String? error;

  DataState _stateType = DataState.loading;
  DataState get stateType => _stateType;

  void changeState(DataState s) {
    _stateType = s;
    notifyListeners();
  }

  Future<void> getPatientDetail(int id) async {
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
            await PatientApi().patientdetail(tokenModel.accessToken!, id);
        if (response.statusCode == 200) {
          PatientByidModels patientResponse =
              PatientByidModels.fromJson(response.data);
          patientDataId = patientResponse.data!;
          medicRecord = patientDataId.medicRecord!;

          notifyListeners();
          changeState(DataState.succes);

          debugPrint(response.data.toString());
          debugPrint(patientDataId.fullName);
        }
      } on DioError catch (e) {
        changeState(DataState.error);
        if (e.response!.statusCode != 503) {
          ErrorModel errorData = ErrorModel.fromJson(e.response!.data);
          error = errorData.error!;
          debugPrint(error);
        } else {
          error = e.response!.statusCode!.toString() + ' Service Unavailable';
          debugPrint(e.message.toString());
        }
      }
    }
  }
}
