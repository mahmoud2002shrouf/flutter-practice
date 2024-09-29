import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/main.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  shredata!.clear();

                  Get.offAllNamed("/");
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
