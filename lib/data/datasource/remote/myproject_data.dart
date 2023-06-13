import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String userid, String s) async {
    var response = await crud.postData(AppLink.items, {"usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
