import 'package:flutter_application_1/controller/auth/successresetpassword_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text("60".tr,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 25)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const SizedBox(height: 120),
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryColor,
          )),
          Text("48".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("56".tr),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "49".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
        ]),
      ),
    );
  }
}
