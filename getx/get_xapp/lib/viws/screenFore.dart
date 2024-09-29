import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_xapp/controlar/rebilderController.dart';
class ScreenFore extends StatelessWidget {
const ScreenFore({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    RebelderController con=Get.find();
    return Scaffold(appBar: AppBar(title: const Text("screen fore"),),body:  Center(child: Text("${con.counter1.value}"),));
  }
}