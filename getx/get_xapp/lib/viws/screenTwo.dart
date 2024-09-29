import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_xapp/controlar/home_controlar.dart';
class ScreenTow extends StatelessWidget {
const ScreenTow({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context){
     HomeController cont=Get.find();

    return Scaffold(appBar: AppBar(title:const Text("screen tow") ,),body: Text("${cont.counter.value}"));
  }
}