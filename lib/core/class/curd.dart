import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:delivery_app/core/class/statusRequest.dart';

class Crud {
  final Dio _dio = Dio();

  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      Response response = await _dio.post(url, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data);
      } else {
        return const Left(StatusRequest.serverfailuor);
      }
    } on DioException catch (e) {
      // خطأ من السيرفر أو من Dio
      return const Left(StatusRequest.serverfailuor);
    } catch (e) {
      // خطأ غير متوقع
      return const Left(StatusRequest.serverException);
    }
  }
}




