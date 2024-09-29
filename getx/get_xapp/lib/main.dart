import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_xapp/req/home_page.dart';
import 'package:get_xapp/req/login.dart';
import 'package:get_xapp/req/middlware/auth.dart';
import 'package:get_xapp/req/servises/share_prf.dart';
// import 'package:get_xapp/utils/myBinding.dart';
// import 'package:get_xapp/viws/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServ();
  runApp(const MyApp());
}

Future<void> initServ() async {
  await Get.putAsync(() => SharePref().init());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return   GetMaterialApp(
//       initialBinding: MyBinding(),
//       getPages: [GetPage(name: "/", page: ()=> const Home())],
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "getx",
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: [
        GetPage(
            name: "/",
            page: () => const Login(),
            transition: Transition.cupertino,
            middlewares: [Auth()]),
        GetPage(
          name: "/home",
          page: (() => const HomePage()),
          transition: Transition.cupertino,
        )
      ],
    );
  }
}
