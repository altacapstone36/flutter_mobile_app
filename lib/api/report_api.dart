import 'package:dio/dio.dart';

class ReportApi {
  final _dio = Dio();
  String baseUrl = 'https://go-hospital-server.herokuapp.com/api';

  Future<Response> report(String token) async {
    Response response;
    response = await _dio.get(baseUrl + '/outpatient/log',
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    return response;
  }
}
