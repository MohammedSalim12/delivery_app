import 'package:delivery_app/linkapi.dart';
import 'package:dio/dio.dart';

class PendingData {
  Dio dio;
  PendingData(this.dio);

  getData() async {
    var response = await dio.get("${Applink.viewpending}?");

    return response.data;
  }

  approve(String deliverid, String usersid , String orderid) async {
    var response = await dio.put("${Applink.approve}?deliveryid=$deliverid&usersid=$usersid&orderid=$orderid");

    return response.data;
  }
  
}
