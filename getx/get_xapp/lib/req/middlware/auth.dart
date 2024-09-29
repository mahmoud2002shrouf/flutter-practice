import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_xapp/main.dart';

class Auth extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharePref!.getString('id') != null) return  RouteSettings(name: '/home');
  }
}
