import 'package:dio/dio.dart';

class PatientApi {
  final _dio = Dio();
  String baseUrl = 'https://go-hospital-server.herokuapp.com/api';

  Future<Response> patient(String token) async {
    Response response;
    response = await _dio.get(baseUrl + '/patient',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response;
  }

  Future<Response> patientdetail(String token, int id) async {
    Response response;
    response = await _dio.get(baseUrl + '/patient/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response;
  }
}
