import 'dart:io';
import 'package:flutter_application_1/core/class/crud.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';

import 'package:async/async.dart';
import 'package:flutter_application_1/linkapi.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../../core/services/services.dart';

class AddItem {


  MyServices myServices = Get.find();

  addData(
    String name,
    String desc,
    String count,
    String price,
    String discount,
      String catId,

      File file,
    String filename,
  ) async {
    var length = await file.length(); //imageFile is your image file
    var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(AppLink.additems),
    );
    var multipartFileSign = http.MultipartFile('files', stream, length,
        filename: basename(file.path), contentType: MediaType('image', 'png'));
    request.files.add(multipartFileSign);

    request.fields['userid'] = myServices.sharedPreferences.getString("id")! ;
    request.fields['catid'] = catId;
    request.fields['namear'] = name;
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['desc'] = desc;
    request.fields['descar'] = desc;
    request.fields['count'] = count;
    request.fields['discount'] = discount;
    request.fields['datenow'] = DateFormat('dd-MM-yyyy').format(DateTime.now());

    var response = await request.send();
    if (response.statusCode == 200) {
      Get.snackbar("Success", "the Item added successfully",snackPosition: SnackPosition.TOP);

    }else
      {
        Get.snackbar("Error", "Try again",snackPosition: SnackPosition.TOP);

        print(response.statusCode);
      }
    return response;
  }

  getData(

      ) async {
    var response = await Crud().postData(AppLink.myproject, {
      "usersid": myServices.sharedPreferences.getString("id")!,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteItem(
String itemsId
      ) async {
    var response = await Crud()
        .postData(AppLink.deleteItem, {"imagename": myServices.sharedPreferences.getString("id")!, "id": itemsId});
    return response.fold((l) => l, (r) => r);
  }
}
