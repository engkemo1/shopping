import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/function/handingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import '../../data/datasource/remote/add_item.dart';

class AddItemController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? count;
  TextEditingController? discount;
  TextEditingController? disc;
  TextEditingController? price;

  File? file;
  String? filename;

  intialData() {
    name = TextEditingController();    price = TextEditingController();

    count = TextEditingController();
    discount = TextEditingController();
    disc = TextEditingController();
  }

  addItem() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await AddItem().addData(
        name!.text, disc!.text, count!.text,price!.text, discount!.text, file!, filename!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      // if (response['status'] == "success") {
      //   print(response['status']);
      // } else {
      //   statusRequest = StatusRequest.failure;
      // }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
