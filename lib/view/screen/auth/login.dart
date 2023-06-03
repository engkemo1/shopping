import 'package:flutter_application_1/controller/auth/login_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imgaeasset.dart';
import 'package:flutter_application_1/core/function/alertexitapp.dart';
import 'package:flutter_application_1/core/function/validinput.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter_application_1/view/widget/auth/logoauth.dart';
import 'package:flutter_application_1/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      //const LogoAuth(),

                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "11".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "12".tr),
                      const SizedBox(height: 30),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "13".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "14".tr,
                        // mycontroller: ,
                      ),
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "15".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "16".tr,
                          // mycontroller: ,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "17".tr,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomButtomAuth(
                          text: "18".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(height: 40),
                      Lottie.asset(AppImageAsset.LogIn),
                      CustomTextSignUpOrSignIn(
                        textone: "19".tr,
                        texttwo: "20".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      )
                    ]),
                  ),
                )),
          )),
    );
  }
}
