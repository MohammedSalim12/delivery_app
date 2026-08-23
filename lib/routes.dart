import 'package:delivery_app/core/middelware/mymiddelware.dart';
import 'package:delivery_app/view/screen/auth/login.dart';
import 'package:delivery_app/view/screen/auth/signup.dart';
import 'package:delivery_app/core/constant/nameroutes.dart';
import 'package:delivery_app/view/screen/homescreen.dart';
import 'package:delivery_app/view/screen/languge.dart';
import 'package:delivery_app/view/screen/orders/accepted.dart';
import 'package:delivery_app/view/screen/orders/details.dart';
import 'package:delivery_app/view/screen/orders/pending.dart';
import 'package:get/get.dart';

List<GetPage>? routes = [  
   GetPage(name:"/" , page: () => Homescreen()),
   GetPage(name: Approutes.login, page:() => Login() ),
   GetPage(name: Approutes.signup, page:() => Signup() ),
   GetPage(name: Approutes.homepage, page:() => Pending() ),
   GetPage(name: Approutes.details, page:() => Details() ),
   GetPage(name: Approutes.accebted, page:() => Accepted() ),
   GetPage(name: Approutes.homescren, page:() => Homescreen() ),
];

// Language() , middlewares: [Mymiddelware()]