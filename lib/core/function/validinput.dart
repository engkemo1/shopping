import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "51".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "51".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "51".tr;
    }
  }

  if (val.isEmpty) {
    return"57".tr;
  }

  if (val.length < min) {
    return "58".tr;
  }

  if (val.length > max) {
    return "59".tr;
  }
}