import 'package:delivery_app/core/constant/nameroutes.dart';
import 'package:delivery_app/core/localization/changelocal_controller.dart';
import 'package:delivery_app/view/widget/language/coustombuttomlan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class Language extends GetView<Localecontroller> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 20),
            Coustombuttomlan(
              textbuttom: "العربية",
              onPressed: () {
                controller.changeLand("ar");
                Get.toNamed(Approutes.login);
              },
            ),
            Coustombuttomlan(
              textbuttom: "Eeglish",
              onPressed: () {
                controller.changeLand("en");
                Get.toNamed(Approutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
