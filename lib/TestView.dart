import 'package:flutter_application_1/controller/test_controller.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/function/checkinternet.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;

  intialdata() async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    intialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
            
            ],
          )),
    );
  }
}