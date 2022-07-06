import 'package:dio/dio.dart';
import 'package:hospital_management/model/outpatient/outpatient_model.dart';

class OutpatientApi {
  final dio = Dio();

  String baseUrl = 'https://go-hospital-server.herokuapp.com/api';

  Future<Response> getOutpatient(String token) async {
    Response response = await dio.get(baseUrl + '/outpatient',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response;
  }
}
