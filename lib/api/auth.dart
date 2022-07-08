import 'package:dio/dio.dart';

import '../model/user/register_model.dart';

class Auth {
  final _dio = Dio();
  String baseUrl = 'https://go-hospital-server.herokuapp.com/api';

  Future<Response> register({required RegisterModel data}) async {
    Response response;
    response = await _dio.post(baseUrl + '/register', data: data.toJson());
    return response;
  }

  Future<Response> findEmail(String email) async {
    Response response;
    var data = {'email': email};
    response = await _dio.get(baseUrl + '/find_email', queryParameters: data);
    return response;
  }

  Future<Response> forgotPassword(
      {required String pass, required String token}) async {
    Response response;
    var data = {'password': pass};
    response = await _dio.post(baseUrl + '/forgot_password',
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response;
  }

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

  Future<Response> changePassword(String token, String pass) async {
    Response response;
    var data = {'password': pass};
    response = await _dio.post(baseUrl + '/change_password',
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return response;
  }
}
