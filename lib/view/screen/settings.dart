import 'package:flutter_application_1/controller/settings_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imgaeasset.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import 'about_us.dart';
import 'language.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool ar = false;
  MyServices myServices = Get.find();

  SettingsController controller = Get.put(SettingsController());
  LocaleController local = Get.put(LocaleController());
  @override
  Widget build(BuildContext context) {


    return ListView(
      children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill)),
            height: Get.width / 3,
          ),
          Positioned(
              top: Get.width / 3.9,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: const AssetImage(AppImageAsset.avatar),
                ),
              )),
        ]),
        const SizedBox(
          height: 60,
        ),
        Center(
          child: Text(
            myServices.sharedPreferences.getString("username")!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Center(
          child: Text(
            myServices.sharedPreferences.getString("email")!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Center(
          child: Text(
            myServices.sharedPreferences.getString("phone")!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.ordersarchive);
                },
                trailing: Icon(Icons.archive_sharp, color: Color(0xffe74c3c)),
                title: Text("Archive"),
              ),
              ListTile(
                onTap: () {
                  Get.to(AboutUs());
                },
                trailing:
                    Icon(Icons.help_outline_rounded, color: Color(0xffe74c3c)),
                title: Text("About us"),
              ),
              ListTile(
                onTap: () {
                  Get.bottomSheet(BottomSheet(
                      onClosing: () {},
                      builder: (_) => Container(
                            height: 130,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    local.changeLang("ar");
                                    setState(() {
                                      ar=true;
                                    });
                                    Get.back();
                                  },
                                  leading: const Text(
                                    'Ar',
                                    style: TextStyle(
                                        color: Color(0xffe74c3c),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                ListTile(
                                  onTap: () {
                                    local.changeLang("en");
                                    setState(() {
                                      ar=false;
                                    });
                                    Get.back();
                                  },
                                  leading: const Text('En',
                                      style: TextStyle(
                                          color: Color(0xffe74c3c),
                                          fontWeight: FontWeight.bold)),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                )
                              ],
                            ),
                          )));
                },
                trailing: ar==true?const Text(
                        'Ar',
                        style: TextStyle(color: Color(0xffe74c3c)),
                      )
                    : const Text('En', style: TextStyle(color: Color(0xffe74c3c))),
                title: const Text("Language"),
              ),
              ListTile(
                onTap: () {
                  controller.logout();
                },
                title: Text("Logout"),
                trailing:
                    Icon(Icons.exit_to_app_outlined, color: Color(0xffe74c3c)),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
