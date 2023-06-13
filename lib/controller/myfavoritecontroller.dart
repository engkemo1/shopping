import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/function/handingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/myfavorite_data.dart';
import 'package:flutter_application_1/data/model/myfavorite.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class MyFavoriteController extends SearchMixController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

//  key => id items
//  Value => 1 OR 0

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favroiteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = favoriteData.deleteData(favroiteid);
    data.removeWhere((element) => element.favoriteId == favroiteid);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
