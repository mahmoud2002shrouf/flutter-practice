import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_xapp/main.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.blue,
           
              padding: const EdgeInsets.symmetric(vertical:10 ,horizontal: 20),
              child: InkWell(
                  onTap: () {
                    sharePref!.setString("id", "1");
                    Get.offNamed('home');
                  },
                  child: const Text(
                    "login",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
