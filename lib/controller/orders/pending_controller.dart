import 'package:delivery_app/controller/traking_controller.dart';
import 'package:delivery_app/core/class/statusRequest.dart';
import 'package:delivery_app/core/data/datasource/orderpending_data.dart';
import 'package:delivery_app/core/data/model/ordermodel.dart';
import 'package:delivery_app/core/function/handingdatacontroller.dart';
import 'package:delivery_app/core/services/myserveies.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PendingController extends GetxController {
  Myserveies myservices = Get.find();
  PendingData pendingData = PendingData(Dio());
  StatusRequest statusRequest = StatusRequest.loading;

  List<Ordersmodel> data = [];

  String printTyprOrder(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Drive Thru";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The order is bening prapered";
    } else if (val == "2") {
      return "Redy To Picked up by Delivery man";
    } else if (val == "3") {
      return "in the way";
    } else {
      return "Archive";
    }
  }

  getOrder() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.getData();
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Ordersmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  approveOrder(String usersid, String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.approve(
      myservices.sharedPreferences.getString("deliveryid")!,
      usersid,
      orderid,
    );
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.put(TrakingController());
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }

  refreshOrder() {
    getOrder();
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}
