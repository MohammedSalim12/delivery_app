import 'package:delivery_app/core/class/statusRequest.dart';
import 'package:delivery_app/core/constant/nameroutes.dart';
import 'package:delivery_app/core/data/datasource/loging_data.dart';
import 'package:delivery_app/core/services/myserveies.dart';
import 'package:delivery_app/linkapi.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Myserveies myserveies = Get.find();
  Dio dio = Dio();
  LogingData logingData = LogingData(Dio());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusrequest = StatusRequest.none;
  bool isshowpasswoed = true;

  showPassword() {
    isshowpasswoed = isshowpasswoed == true ? false : true;
    update();
  }

  login() async {
    try {
      statusrequest = StatusRequest.loading;
      update();
      print("EMAIL: ${email.text}");
      print("PASSWORD: ${password.text}");
      print("LOGIN URL: ${Applink.login}");

      var response = await logingData.postData(email.text, password.text);
      print("LOGIN RESPONSE: $response");

      if (response["status"] == "success") {
        statusrequest = StatusRequest.success;

        var data = response['data']; // ✅ هون الداتا الفعلية

        if (data['delivery_approve'] == 1) {
          myserveies.sharedPreferences.setString(
            "deliveryid",
            data["delivery_id"].toString(),
          );
          String deliveryid = myserveies.sharedPreferences.getString(
            "deliveryid",
          )!;

          myserveies.sharedPreferences.setString(
            "deliveryname",
            data["delivery_name"],
          );
          myserveies.sharedPreferences.setString(
            "deliveryemail",
            data["delivery_email"],
          );
          myserveies.sharedPreferences.setString(
            "deliveryphone",
            data["delivery_phone"],
          );
          myserveies.sharedPreferences.setString("step", "2");

          FirebaseMessaging.instance.subscribeToTopic("delivery");
          FirebaseMessaging.instance.subscribeToTopic("delivery$deliveryid");

          Get.offNamed(Approutes.homescren);
        } else {
          Get.snackbar("تنبيه", "الحساب غير مفعّل بعد");
        }
      } else {
        Get.snackbar("خطأ", response["message"] ?? "بيانات خاطئة");
        statusrequest = StatusRequest.failuor;
      }
    } catch (e) {
      print("LOGIN CATCH ERROR: $e");
      statusrequest = StatusRequest.serverfailuor;
      update();
      Get.snackbar("خطأ", "فشل الاتصال بالسيرفر");
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
