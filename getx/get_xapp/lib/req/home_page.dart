import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_xapp/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
                backgroundColor: Colors.blue,

      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.red,
           
              padding: const EdgeInsets.symmetric(vertical:10 ,horizontal: 20),
              child: InkWell(
                  onTap: () {
                    sharePref!.clear();
                    Get.offNamed('/',);
                  },
                  child: const Text(
                    "logout",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
