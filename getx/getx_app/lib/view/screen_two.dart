import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controler/HomeController.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Homecontroller controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text("screen two"),
        ),
        body: Center(
          child: Text("${controller.counter}"),
        ));
  }
}
