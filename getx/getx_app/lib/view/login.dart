import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  shredata!.setString("id", "1");

                  Get.offAllNamed('logout');
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
