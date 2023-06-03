import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getItems() async {
    var response = await crud.postData(AppLink.items, {
      'id':'1',
      'usersid':'32'
    });
    return response.fold((l) => l, (r) => r);
  }
  getCategories() async {
    var response = await crud.postData(AppLink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
