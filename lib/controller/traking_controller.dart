import 'dart:async';

import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/core/class/statusRequest.dart';
import 'package:delivery_app/core/constant/nameroutes.dart';
import 'package:delivery_app/core/data/model/ordermodel.dart';
import 'package:delivery_app/core/function/getdecodepolyline.dart';
import 'package:delivery_app/core/services/myserveies.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrakingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  late CameraPosition? cameraPosition;
  Set<Polyline> polylineSet = {};
  Myserveies myserveies = Get.find();
  Timer? timer;

  late Ordersmodel ordersmodel;
  List<Marker> markers = [];

  double? dislat;
  double? dislong;

  double? currentlat;
  double? currentlong;

  StatusRequest statusRequest = StatusRequest.success;
  AcceptedController acceptedController = Get.find();

  donedelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    await acceptedController.doneDelivery(
      ordersmodel.ordersId!,
      ordersmodel.ordersUserid!,
    );
    Get.offAllNamed(Approutes.homepage);
  }

  getCurrentLocation() {
    cameraPosition = CameraPosition(
      target: LatLng(
        double.parse(ordersmodel.addressLat!),
        double.parse(ordersmodel.addressLong!),
      ),
      zoom: 14.4746,
    );
    markers.add(
      Marker(
        markerId: MarkerId("dest"),
        position: LatLng(
          double.parse(ordersmodel.addressLat!),
          double.parse(ordersmodel.addressLong!),
        ),
      ),
    );
    positionStream = Geolocator.getPositionStream().listen((
      Position? position,
    ) {
      print("========================== current ");
      if (gmc != null) {
        gmc!.animateCamera(
          CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)),
        );
      }

      markers.removeWhere((element) => element.markerId.value == "current");
      markers.add(
        Marker(
          markerId: MarkerId("current"),
          position: LatLng(position!.latitude, position.longitude),
        ),
      );
      update();
    });
  }

  refreshLocation() async {
    await Future.delayed(Duration(seconds: 2));
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      // FirebaseFirestore.instance
      //     .collection("delivery")
      //     .doc(ordersmodel.ordersId)
      //     .set({
      //       "lat": currentlat,
      //       "lomg": currentlong,
      //       "deliveryid": myserveies.sharedPreferences.getString("id"),
      //     });
    });
  }

  initpolyline() async {
    dislat = double.parse(ordersmodel.addressLat!);
    dislong = double.parse(ordersmodel.addressLong!);
    await Future.delayed(Duration(seconds: 1));
    polylineSet = await getPolyline(currentlat, currentlong, dislat, dislong);
    update();
  }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordermodel'];
    getCurrentLocation();
    initpolyline();
    refreshLocation();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    gmc!.dispose();
    timer!.cancel();
    super.onClose();
  }
}
