import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controler/recontroller.dart';

class ScreenFore extends StatelessWidget {
  const ScreenFore({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenForePage'),
      ),
      body: Center(
        child: GetBuilder<Recontroller>(
          init: Recontroller(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${controller.counter1}"),
                Text("${controller.counter2}"),
                Text("${controller.sum}"),
                ElevatedButton(
                    onPressed: () {
                      controller.inc1();
                    },
                    child: const Text("add 1")),
                ElevatedButton(
                    onPressed: () {
                      controller.inc2();
                    },
                    child: const Text("add 2"))
              ],
            );
          },
        ),
      ),
    );
  }
}
