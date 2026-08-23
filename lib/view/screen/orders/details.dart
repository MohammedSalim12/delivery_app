import 'package:delivery_app/controller/orders/detalis_controller.dart';
import 'package:delivery_app/core/class/handingdataview.dart';
import 'package:delivery_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Detieles')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<OrderdetielesController>(
          builder: (controller) => Handingdataview(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  "Item",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Appcolor.secoundcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "QTY",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Appcolor.secoundcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Appcolor.secoundcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            // TableRow(
                            //   children: [
                            //     Text("Mac book", textAlign: TextAlign.center),
                            //     Text("2", textAlign: TextAlign.center),
                            //     Text("1200", textAlign: TextAlign.center),
                            //   ],
                            // ),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(
                                children: [
                                  Text("${controller.data[index].itemsName}", textAlign: TextAlign.center),
                                  Text("${controller.data[index].itemsCount}", textAlign: TextAlign.center),
                                  Text("${controller.data[index].itemsPrice}", textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Total Price this order : ${controller.ordersmodel.ordersTolotalprice}\$ ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Appcolor.secoundcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if(controller.ordersmodel.orderstype == "0")
                Card(
                  child: Container(
                    child: ListTile(
                      title: Text(
                        "Shipping Address",
                        style: TextStyle(
                          color: Appcolor.secoundcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        "${controller.ordersmodel.addressCity} ${controller.ordersmodel.addressStreet}",
                      ),
                    ),
                  ),
                ),
                if(controller.ordersmodel.orderstype == "0")
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 300,
                    width: double.infinity,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.complertecontroller?.complete(controllermap);
                      },
                    ),
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
