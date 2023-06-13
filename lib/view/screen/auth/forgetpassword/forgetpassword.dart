import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imgaeasset.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtexttitleauth.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text("21".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Color.fromARGB(255, 245, 245, 245))),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    const SizedBox(height: 40),
                    Lottie.asset(AppImageAsset.ForgetPassword),
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(text: "22".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(
                        // please Enter Your Email Address To Recive A verification code
                        text: "23".tr),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {},
                      mycontroller: controller.email,
                      hinttext: "24".tr,
                      iconData: Icons.email_outlined,
                      labeltext: "25".tr,
                      // mycontroller: ,
                    ),
                    CustomButtomAuth(
                        text: "26".tr,
                        onPressed: () {
                          controller.checkemail();
                        }),
                    const SizedBox(height: 40),
                  ]),
                ),
              ))),
    );
  }
}
