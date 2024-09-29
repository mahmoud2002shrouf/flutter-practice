import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:getx_app/main.dart';

class Middelware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
   if(shredata!.getString("id")!=null) return RouteSettings(name: "/logout")   ;
  }
}