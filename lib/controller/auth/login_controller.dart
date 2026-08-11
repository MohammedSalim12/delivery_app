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

      if (response["state"] == "success") {
        statusrequest = StatusRequest.success;

        // ✅ تصحيح المسار: نقرأ القيمة مباشرة وليس داخل data
        if (response['delivery_approve'] == 1) {
          // الحساب مفعّل -> احفظ البيانات وروح للهوم
          myserveies.sharedPreferences.setString(
            "deliveryid",
            response["delivery_id"].toString(),
          );
          String deliveryid = myserveies.sharedPreferences.getString(
            "deliveryid",
          )!;

          myserveies.sharedPreferences.setString(
            "deliveryname",
            response["delivery_name"],
          );
          myserveies.sharedPreferences.setString(
            "deliveryemail",
            response["delivery_email"],
          );
          myserveies.sharedPreferences.setString(
            "deliveryphone",
            response["delivery_phone"],
          );
          myserveies.sharedPreferences.setString("step", "2");
          FirebaseMessaging.instance.subscribeToTopic("delivery");
          FirebaseMessaging.instance.subscribeToTopic("delivery${deliveryid}");
          Get.offNamed(Approutes.homepage);
        } else {
          // الحساب غير مفعّل -> روح لصفحة إدخال كود التفعيل

          // Get.toNamed(
          //   Approutes.veryficodesignup,
          //   arguments: {"email": email.text},

          // );
        }
      } else {
        // الإيميل غلط أو الباسورد غلط
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
