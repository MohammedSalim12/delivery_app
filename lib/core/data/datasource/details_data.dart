import 'package:delivery_app/linkapi.dart';
import 'package:dio/dio.dart';

class DetailsData {
  Dio dio;
  DetailsData(this.dio);

  getData(String deliveryid) async {
    var response = await dio.get("${Applink.detalis}?deliveryid=$deliveryid");
    return response.data;
  }
  
}
