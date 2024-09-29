import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_xapp/controlar/home_controlar.dart';
import 'package:get_xapp/controlar/rebilderController.dart';
import 'package:get_xapp/viws/screenFore.dart';
import 'package:get_xapp/viws/screenOne.dart';
import 'package:get_xapp/viws/screenTwo.dart';
import 'package:get_xapp/viws/screenthree.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
   

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  Get.to(const ScreenOne(),transition: Transition.zoom);
                },
                child: const Text('screen one'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    Get.to(const ScreenTow());
                  },
                  child: const Text('screen tow')),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    Get.to(const ScreenThree());
                  },
                  child: const Text('screen three')),
                  const SizedBox(
                height: 16,
              ),
                   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    Get.to(const ScreenFore());
                  },
                  child: const Text('screen fore'))
            ],
          ),

        ));
  }
}
