import 'package:delivery_app/core/constant/apptheme.dart';
import 'package:delivery_app/core/function/fcmconfing.dart';
import 'package:delivery_app/core/services/myserveies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localecontroller extends GetxController {
  Locale? language;
  Myserveies myservices = Get.find();

  ThemeData apptheme = themeEnglish;
  changeLand(String langcode) {
    Locale locale = Locale(langcode);
    myservices.sharedPreferences.setString("lang", langcode);
    apptheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    String? sharedPrefLang = myservices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = Locale("ar");
      apptheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = Locale("en"); 
      apptheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = themeEnglish;
    }
    super.onInit();
  }
}
