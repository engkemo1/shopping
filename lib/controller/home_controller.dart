import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/function/handingdatacontroller.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/home_data.dart';
import 'package:flutter_application_1/data/model/categoriesmodel.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';

import '../data/model/myfavorite.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getCategories();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;
 bool isLoading=false;
  bool isLoading2=false;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  List<MyFavoriteModel> data = [];

  // List items = [];

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getCategories();
    getItems();
    initialData();
    super.onInit();
  }

  @override
  Future getCategories() async {
    statusRequest = StatusRequest.loading;
    List <CategoriesModel> catList=[];
    isLoading=true;
    var response = await homedata.getCategories();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['data']);
        catList =
            (response['data'] as List).map((e) => CategoriesModel.fromJson(e)).toList();
        isLoading=false;

      } else {
        isLoading=false;

        statusRequest = StatusRequest.failure;
      }
    }
    update();
    return catList;

  }
  getItems() async {
    isLoading2=true;

    statusRequest = StatusRequest.loading;
    var response = await homedata.getItems();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
        isLoading2=false;

      } else {
        isLoading2=true;

        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
