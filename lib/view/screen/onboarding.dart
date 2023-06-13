import 'package:flutter_application_1/controller/onboarding_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/onboarding/customslider.dart';
import 'package:flutter_application_1/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/onboarding/custombutton.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        body: SafeArea(
      child: Column(children: [
        const SizedBox(height: 100),
        Expanded(
          flex: 4,
          child: CustomSliderOnBoarding(),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: 19),
                CustomDotControllerOnBoarding(),
                Spacer(flex: 18),
                CustomButtonOnBoarding()
              ],
            ))
      ]),
    ));
  }
}
