import 'package:delivery_app/controller/auth/login_controller.dart';
import 'package:delivery_app/core/class/handingdataview.dart';
import 'package:delivery_app/core/constant/appcolor.dart';
import 'package:delivery_app/core/function/alerttextapp.dart';
import 'package:delivery_app/core/function/vaildinput.dart';
import 'package:delivery_app/view/widget/auth/coustembuttomauth.dart';
import 'package:delivery_app/view/widget/auth/coustemtextauthtitle.dart';
import 'package:delivery_app/view/widget/auth/coustemtextbodyauth.dart';
import 'package:delivery_app/view/widget/auth/coustemtextformauth.dart';
import 'package:delivery_app/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: Appcolor.grey),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          bool exit = await alertExitApp(); // نفس دالتك القديمة
          if (exit) {
            Navigator.pop(context);
          }
        },
        child: GetBuilder<LoginController>(
          builder: (controller) => Handingdataview(
            statusRequest: controller.statusrequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: Form(
                child: ListView(
                  children: [
                    Logoauth(),
                    Coustemtextauthtitle(text: "9".tr),
                    SizedBox(height: 10),
                    Coustemtextbodyauth(textbody: "8".tr),
                    SizedBox(height: 10),
                    CustomTextFormAuth(
                      isNumber: false,
                      hinttext: "Enter your email",
                      iconData: Icons.email_outlined,
                      labeltext: "Email",
                      mycontroller: controller.email,
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                    ),
                    CustomTextFormAuth(
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      isNumber: false,
                      hinttext: "Enter your password",
                      iconData: Icons.lock_outline,
                      labeltext: "Password",
                      mycontroller: controller.password,
                      valid: (val) {
                        return validInput(val!, 5, 100, "password");
                      },
                    ),
                    SizedBox(height: 10),
                    Coustembuttomauth(
                      text: "Login",
                      onPressed: controller.login,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
