import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/core/class/handingdataview.dart';
import 'package:delivery_app/view/widget/order/Cardorderlistaccebted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accepted extends StatelessWidget {
  const Accepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedController());
    return Container(padding: EdgeInsets.all(10),
      child: GetBuilder<AcceptedController>(
        builder: (controller) => Handingdataview(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: ((context, index) =>
                CardOrederListaccepted(listdata: controller.data[index])),
          ),
        ),
      ),);
  }
}
