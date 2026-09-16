import 'package:delivery_app/controller/orders/detalis_controller.dart';
import 'package:delivery_app/controller/traking_controller.dart';
import 'package:delivery_app/core/class/handingdataview.dart';
import 'package:delivery_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Traking extends StatelessWidget {
  const Traking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderdetielesController controller = Get.find();
    Get.put(TrakingController());
    return Scaffold(
      appBar: AppBar(title: const Text('Order Traking')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<TrakingController>(
          builder: (controller) => Handingdataview(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    child: GoogleMap(
                      polylines: controller.polylineSet,
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.gmc = controllermap;
                      },
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: MaterialButton(
                    minWidth: 300,
                    color: Appcolor.primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.donedelivery();
                    },
                    child: Text("Done"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
