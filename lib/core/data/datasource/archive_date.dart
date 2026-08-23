import 'package:delivery_app/linkapi.dart';
import 'package:dio/dio.dart';

class ArchiveDate {
  Dio dio;
  ArchiveDate(this.dio);

  getData(String deliveryid) async {
    var response = await dio.get("${Applink.viewarchive}?deliveryid=$deliveryid");
    return response.data;
  }
  
}
