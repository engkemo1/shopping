import 'package:flutter_application_1/controller/auth/successsignup_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imgaeasset.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('47'.tr,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 25)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const SizedBox(height: 80),
          Lottie.asset(AppImageAsset.Success),
          Text("48".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "49".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
