import 'package:dio/dio.dart';

class Auth {
  final _dio = Dio();
  String baseUrl = 'https://go-hospital-server.herokuapp.com/api';

  Future<Response> login(
      {required String email, required String password}) async {
    Response response;
    var data = {'email': email, 'password': password};

    response = await _dio.post(baseUrl + '/login', data: data);
    return response;
  }

  Future<Response> logOut(String token) async {
    Response response;
    response = await _dio.post(baseUrl + '/logout',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response;
  }
}
