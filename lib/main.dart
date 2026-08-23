import 'package:delivery_app/bindeing/initialBinding.dart';
import 'package:delivery_app/core/localization/changelocal_controller.dart';
import 'package:delivery_app/core/localization/tranzalation.dart';
import 'package:delivery_app/core/services/myserveies.dart';
import 'package:delivery_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inititalServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Localecontroller controller = Get.put(Localecontroller());
    return GetMaterialApp(
      translations: MyTranzalion(),
      initialBinding: Initialbinding(),
      locale: controller.language,
      theme: controller.apptheme,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
