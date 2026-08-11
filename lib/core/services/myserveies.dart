import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myserveies extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<Myserveies> init() async {
    //Start services
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    //End 
    return this;
  }
}

inititalServices() async {
  await Get.putAsync(() => Myserveies().init());
}
