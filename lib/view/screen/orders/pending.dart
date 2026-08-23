import 'package:delivery_app/controller/orders/pending_controller.dart';
import 'package:delivery_app/core/class/handingdataview.dart';
import 'package:delivery_app/view/widget/order/Cardorderlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pending extends StatelessWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
    return Container(
      padding: EdgeInsets.all(10),
      child: GetBuilder<PendingController>(
        builder: (controller) => Handingdataview(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: ((context, index) =>
                CardOrederList(listdata: controller.data[index])),
          ),
        ),
      ),
    );
  }
}
