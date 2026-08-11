import 'package:delivery_app/view/screen/auth/login.dart';
import 'package:delivery_app/view/screen/auth/signup.dart';
import 'package:delivery_app/core/constant/nameroutes.dart';
import 'package:delivery_app/view/screen/home.dart';
import 'package:get/get.dart';

List<GetPage>? routes = [
   GetPage(name:"/" , page: () => Login()),
   GetPage(name: Approutes.login, page:() => Login() ),
   GetPage(name: Approutes.signup, page:() => Signup() ),
   GetPage(name: Approutes.homepage, page:() => Home() ),
];