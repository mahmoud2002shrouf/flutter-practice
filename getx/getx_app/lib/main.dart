import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:getx_app/controler/middelWare.dart";
import "package:getx_app/ninding.dart";
import "package:getx_app/view/login.dart";
import "package:getx_app/view/logout.dart";
import './Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? shredata;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  shredata=await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'getx',
      theme: ThemeData(primarySwatch: Colors.blue),
      // initialBinding: Binding(),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => const Login(),middlewares: [Middelware()]),GetPage(name: "/logout", page: ()=>const Logout())],
    );
  }
}
