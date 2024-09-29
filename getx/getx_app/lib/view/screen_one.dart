import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controler/HomeController.dart';
class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});
  @override
  Widget build(context) {
    Homecontroller controler=Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('ScreenOnePage'),
        ),
        body: 
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {
                      
                      controler.inc();
                    }, icon: const Icon(Icons.add)),
                    GetBuilder<Homecontroller>(builder: (con){
                      return Text("${con.counter}");

                    }),
                    IconButton(
                        onPressed: () {
                          controler.dec();
                        }, icon: const Icon(Icons.remove)),
                  ],
                ),
              ],
          
        ));
  }
}