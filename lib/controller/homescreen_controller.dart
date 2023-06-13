import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/view/screen/orders/pending.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/screen/notification.dart';
import 'package:flutter_application_1/view/screen/settings.dart';


abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    NotificationView(),
    OrdersPending(),
    Settings()
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "n", "icon": Icons.notifications_active_outlined},
    {"title": "Orders", "icon": Icons.shopping_bag_outlined},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
