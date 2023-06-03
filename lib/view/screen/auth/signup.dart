import 'package:flutter_application_1/controller/auth/login_controller.dart';
import 'package:flutter_application_1/controller/auth/signup_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imgaeasset.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
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

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "24".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.username,
                        hinttext: "29".tr,
                        iconData: Icons.person_outline,
                        labeltext: "30".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 3, 40, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "31".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "32".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 7, 11, "phone");
                        },
                        mycontroller: controller.phone,
                        hinttext: "33".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "34".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 3, 30, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "35".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "36".tr,
                        // mycontroller: ,
                      ),
                      CustomButtomAuth(
                          text: "37".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(height: 10),
                      Lottie.asset(AppImageAsset.SignUp),
                      const SizedBox(height: 0),
                      CustomTextSignUpOrSignIn(
                        textone: "38".tr,
                        texttwo: "39".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ]),
                  ),
                )),
          )),
    );
  }
}
