import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_xapp/controlar/rebilderController.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      RebelderController controller=Get.put(RebelderController(),permanent: true );

    return Scaffold(
        appBar: AppBar(
          title: const Text("screen three"),
        ),
        body: Center(
          child: Column(
            children: [
              GetX<RebelderController>(
                  builder: (controller) {
                    return Text("${controller.counter1.value}");
                  }),
              GetX<RebelderController>(
                  builder: (controller) {
                    return Text("${controller.counter2.value}");
                  }),
              GetX<RebelderController>(
                  builder: (controller) {
                    return Text("${controller.sum}");
                  }),
              TextButton(
                onPressed: () {
                  controller.increment1();
                },
                child: const Text("add counter one "),
              ),
              TextButton(
                onPressed: () {
                  controller.increment2();
                },
                child: const Text("add counter two "),
              )
            ],
          ),
        ));
  }
}
