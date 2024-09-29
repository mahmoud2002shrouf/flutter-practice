import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controler/HomeController.dart';
import 'package:getx_app/view/screen_fore.dart';
import 'package:getx_app/view/screen_one.dart';
import 'package:getx_app/view/screen_two.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('HomePage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ScreenOne());
                  },
                  child: const Text("screen one")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ScreenTwo());
                  },
                  child: const Text("screen two")),
              const SizedBox(
                height: 20,
              ),

              // ElevatedButton(onPressed: (){}, child: const Text("screen three")),
              // const SizedBox(height: 20,),

              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ScreenFore());
                  },
                  child: const Text("screen fore")),
            ],
          ),
        ));
  }
}
//////////////////////
//////////////////////
//////////////////////


//obx
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_app/controler/HomeController.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});
//   @override
//   Widget build(context) {
//     var controler=Get.put(Homecontroller());
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HomePage'),
//         ),
//         body: Obx(
//            () {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(onPressed: () {
//                       controler.inc();
//                     }, icon: const Icon(Icons.add)),
//                     Text("${controler.counter.value}"),
//                     IconButton(
//                         onPressed: () {
//                           controler.dec();
//                         }, icon: const Icon(Icons.remove)),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ));
//   }
// }
//////////////////////////////////////////////////////////////////////////////////////
//getx
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_app/controler/HomeController.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});
//   @override
//   Widget build(context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HomePage'),
//         ),
//         body: GetX<Homecontroller>(
//           init: Homecontroller(),
//           builder: (controller) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(onPressed: () {
//                       controller.inc();
//                     }, icon: const Icon(Icons.add)),
//                     Text("${controller.counter.value}"),
//                     IconButton(
//                         onPressed: () {
//                           controller.dec();
//                         }, icon: const Icon(Icons.remove)),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ));
//   }
// }
//////////////////////////////////////////////////////////////////////////////////
//getbuilder
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_app/controler/HomeController.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});
//   @override
//   Widget build(context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HomePage'),
//         ),
//         body: GetBuilder<Homecontroller>(
//           init: Homecontroller(),
//           builder: (controller) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(onPressed: () {
//                       controller.inc();
//                     }, icon: const Icon(Icons.add)),
//                     Text("${controller.counter}"),
//                     IconButton(
//                         onPressed: () {
//                           controller.dec();
//                         }, icon: const Icon(Icons.remove)),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ));
//   }
// }
