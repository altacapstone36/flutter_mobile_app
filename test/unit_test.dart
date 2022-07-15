import 'package:dio/dio.dart';
import 'package:hospital_management/api/auth.dart';
import 'package:hospital_management/api/outpatient_api.dart';
import 'package:hospital_management/api/patient_api.dart';
import 'package:hospital_management/api/report_api.dart';
import 'package:hospital_management/enums.dart';
import 'package:hospital_management/model/user/model_user_login.dart';
import 'package:hospital_management/screen/patient/patient_view_model.dart';
import 'package:test/test.dart';

void main() {
  Response response;
  String token = '';

  test('Change state test', () {
    PatientViewModel viewModel = PatientViewModel();
    expect(viewModel.state, DataState.loading);

    viewModel.changeState(DataState.succes);
    expect(viewModel.state, DataState.succes);

    viewModel.changeState(DataState.error);
    expect(viewModel.state, DataState.error);
  });
  group('Auth =>', () {
    test('login test', () async {
      response = await Auth()
          .login(email: 'alsyadahmad@holyhos.co.id', password: 'password');
      if (response.statusCode == 200) {
        ModelUserLogin modelUser = ModelUserLogin.fromJson(response.data);
        token = modelUser.jwt!.accessToken!;
      }
      expect(response.statusCode == 200, true);
    });

    test('find email test', () async {
      response = await Auth().findEmail('alsyadahmad@holyhos.co.id');
      expect(response.statusCode == 200, true);
    });
  });

  group('Patient =>', () {
    test('get all patient test', () async {
      response = await PatientApi().patient(token);
      expect(response.statusCode == 200, true);
    });
    test('get patient by id test', () async {
      response = await PatientApi().patientdetail(token, 1);
      expect(response.statusCode == 200, true);
    });
  });

  test('Get all outpatient test', () async {
    response = await OutpatientApi().getOutpatient(token);
    expect(response.statusCode == 200, true);
  });

  test('Get all report test', () async {
    response = await ReportApi().report(token);
    expect(response.statusCode == 200, true);
  });

  test('Log out test ', () async {
    response = await Auth().logOut(token);
    expect(response.statusCode == 200, true);
  });
}
