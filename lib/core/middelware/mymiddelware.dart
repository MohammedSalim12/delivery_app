import 'package:delivery_app/core/constant/nameroutes.dart';
import 'package:delivery_app/core/services/myserveies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddelware extends GetMiddleware {
  int? get Priority => 1;

  Myserveies myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "2") {
       return RouteSettings(name: Approutes.homepage);
    }
    if (myservices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: Approutes.login);
     }
      
    return null;
  }
}
