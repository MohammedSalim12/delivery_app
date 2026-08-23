import 'package:delivery_app/linkapi.dart';
import 'package:dio/dio.dart';

class AcceptedData {
  Dio dio;
  AcceptedData(this.dio);

  getData(String deliveryid) async {
    var response = await dio.get("${Applink.viewaccepted}?deliveryid=$deliveryid");
    return response.data;
  }
  doneDelivery(String orderid , String usersid) async {
    var response = await dio.put("${Applink.doneDelivery}?orderid=$orderid&usersid=$usersid");
    return response.data;
  }
  
}
