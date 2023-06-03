import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Map<String, String> headers = {"Accept":"application/json"};
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data,headers:headers );
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
