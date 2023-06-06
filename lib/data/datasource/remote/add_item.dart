import 'dart:io';

import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;
class AddItem {



  addData( String name, String desc, String count,String price,
      String discount ,File file,String filename,) async {
    var request = http.MultipartRequest(
      'POST', Uri.parse(AppLink.addressAdd),

    );
    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,

      ),
    );
    request.fields.addAll({
      "namear": name,
      "name": name,
      "price": price,
      "desc": desc,
      "descar": desc,
      "count": count,
      "discount": discount,
      "datenow": DateFormat('dd-MM-yyyy').format(DateTime.now()),

    });
    print("request: "+request.toString());
    var res = await request.send();
    return res;
  }


}
