import 'package:delivery_app/controller/orders/pending_controller.dart';
import 'package:delivery_app/core/constant/appcolor.dart';
import 'package:delivery_app/core/constant/nameroutes.dart';
import 'package:delivery_app/core/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrederList extends GetView<PendingController> {
  final Ordersmodel listdata;
  const CardOrederList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listdata.ordersId}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                // Text(listdata.ordersDatatime!),
                Text(
                  Jiffy.parse(listdata.ordersDatatime!).fromNow(),
                  style: TextStyle(color: Appcolor.primaryColor),
                ),
              ],
            ),
            Divider(),
            // Text(
            //   "Order Type : ${controller.printTyprOrder(listdata.orderstype!)}",
            // ),
            Text("Order price : ${listdata.ordersPrice} \$"),
            Text("delivery price : ${listdata.orderspricedelivery} \$"),
            Text(
              "payment method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}",
            ),
            // Text(
            //   "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)}",
            // ),
            Divider(),
            Row(
              children: [
                Text(
                  "Total price:${listdata.ordersTolotalprice}\$",
                  style: TextStyle(
                    color: Appcolor.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(
                      Approutes.details,
                      arguments: {"ordersmodel": listdata},
                    );
                  },
                  child: Text("Detelis"),
                  color: Appcolor.therdcolor,
                  textColor: Appcolor.secoundcolor,
                ),
                Spacer(),
                if (listdata.ordersStatus! == "2")
                  MaterialButton(
                    onPressed: () {
                      controller.approveOrder(
                        listdata.ordersUserid!,
                        listdata.ordersId!,
                      );
                    },
                    child: Text("Approve"),
                    color: Appcolor.therdcolor,
                    textColor: Appcolor.secoundcolor,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
