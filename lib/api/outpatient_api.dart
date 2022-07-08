import 'package:dio/dio.dart';

import '../model/outpatient/process_model.dart';

class OutpatientApi {
  final dio = Dio();

  String baseUrl = 'https://go-hospital-server.herokuapp.com/api';

  Future<Response> getOutpatient(String token) async {
    Response response = await dio.get(baseUrl + '/outpatient',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response;
  }

  Future<Response> getNurse(String token) async {
    Response response = await dio.get(baseUrl + '/user',
        queryParameters: {'role_id': 3, 'facility_id': 1},
        options: Options(headers: {'Authorization': 'Bearer: $token'}));
    return response;
  }

  Future<Response> assignNurse(
      String token, int id, AssignNurseModel nurseData) async {
    Response response = await dio.post(baseUrl + '/outpatient/$id/assign',
        data: nurseData.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response;
  }

  Future<Response> processDoctor(
      int id, String token, ProcessDoctorModel data) async {
    Response response = await dio.post(baseUrl + '/outpatient/$id/process',
        data: data.toJson(),
        options: Options(headers: {'Authorization': 'Bearer: $token'}));
    return response;
  }

  Future<Response> processNurse(
      int id, String token, ProcessNurseModel data) async {
    Response response = await dio.post(baseUrl + '/outpatient/$id/process',
        data: data.toJson(),
        options: Options(headers: {'Authorization': 'Bearer: $token'}));
    return response;
  }
}
