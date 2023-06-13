import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
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
List<ItemsModel> itemsModelList=[];
  File? file;
  String? filename;
  String? catId;
 bool isloading=false;
  intialData() {
    name = TextEditingController();
    price = TextEditingController();

    count = TextEditingController();
    discount = TextEditingController();
    disc = TextEditingController();
  }

  addItem() async {
    print(file!.path);
    await AddItem().addData(name!.text, disc!.text, count!.text,
        price!.text, discount!.text,catId!, file!, filename!,);
  }
  deleteItem(String itemId) async {
 var response=   await AddItem().deleteItem(itemId);
    print(response);
  }

  getItem() async {
    statusRequest = StatusRequest.loading;
   var response= await AddItem().getData();
    itemsModelList =
        (response['data'] as List).map((e) => ItemsModel.fromJson(e)).toList();
    print(itemsModelList.length);
    statusRequest = StatusRequest.success;

     // End

    update();

  }
  @override
  void onInit() {
    intialData();
    getItem();
    super.onInit();
  }
}
