import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 60),
        height: 40,
        child: MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            textColor: Colors.white,
            onPressed: () {
              controller.next();
            },
            color: AppColor.primaryColor,
            child: Text("10".tr)));
  }
}
