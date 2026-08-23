import 'dart:async';
import 'package:delivery_app/core/class/statusRequest.dart';
import 'package:delivery_app/core/data/datasource/details_data.dart';
import 'package:delivery_app/core/data/model/cartmodel.dart';
import 'package:delivery_app/core/data/model/ordermodel.dart';
import 'package:delivery_app/core/function/handingdatacontroller.dart';
import 'package:delivery_app/core/services/myserveies.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderdetielesController extends GetxController {
  late Ordersmodel ordersmodel;

  Completer<GoogleMapController>? complertecontroller;
  Myserveies myservices = Get.find();
  DetailsData orderDetailsData = DetailsData(Dio());
  StatusRequest statusRequest = StatusRequest.loading;

  late CameraPosition? cameraPosition;
  List<Marker> markers = [];
  List<CartModel> data = [];

  double? lat;
  double? long;

  initialData() {
    complertecontroller = Completer<GoogleMapController>();
    if (ordersmodel.orderstype == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(ordersmodel.addressLat!),
          double.parse(ordersmodel.addressLong!),
        ),
        zoom: 14.4746,
      );
      markers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(
            double.parse(ordersmodel.addressLat!),
            double.parse(ordersmodel.addressLong!),
          ),
        ),
      );
    }
  }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordersmodel'];
    complertecontroller = Completer<GoogleMapController>();
    initialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await orderDetailsData.getData((ordersmodel.ordersId!));
    print("ITEMS RESPONSE: $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuor;
      }
    }
    update();
  }
}
