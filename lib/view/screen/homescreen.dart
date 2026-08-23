import 'dart:io';
import 'package:delivery_app/controller/homescreen_controller.dart';
import 'package:delivery_app/core/constant/appcolor.dart';
import 'package:delivery_app/view/widget/home/Coustembuttomappar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenController());
    return GetBuilder<HomescreenController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(
          'orders',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: Appcolor.grey),
        ),
      ),
        bottomNavigationBar: BottomAppBar( 
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             ...List.generate(controller.listpage.length + 1, ((index) {
                int i = index > 1 ? index - 1 : index;
                return index == 2
                    ? Spacer()
                    : Expanded(
                      flex: 90, 
                      child: Coustembuttomappar(
                          text: controller.titlepage[i],
                          icondata: controller.iconpage[i],
                          onPressed: () {
                            controller.changepage(i);
                          },
                          active: controller.currentpage == i ? true : false,  
                        ),
                    );
              })),
            ],
          ),
        ),
        body: WillPopScope(
          child: controller.listpage.elementAt(controller.currentpage),
          onWillPop: () {
            Get.defaultDialog(
              title: "warning",
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              middleText: "Do you want to exit the app",
              onConfirm: () {
                exit(0);
              },
              buttonColor: Appcolor.primaryColor,
              onCancel: () {},
            );
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
