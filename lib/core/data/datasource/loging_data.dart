import 'package:delivery_app/linkapi.dart';
import 'package:dio/dio.dart';

class LogingData {
  Dio dio;
  LogingData(this.dio);

  postData(String email, String password) async {
    var response = await dio.post(
      "${Applink.login}?email=$email&password=$password",
    );
    return response.data;
  }
}
  