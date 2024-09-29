
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Homecontroller extends GetxController {
  int counter = 0;
  void inc() {
    counter++;
    update();
  }
    void dec() {
    counter--;
    update();

  }
}
//getx
// import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';

// class Homecontroller extends GetxController {
//   RxInt counter = 0.obs;
//   void inc() {
//     counter++;
//   }
//     void dec() {
//     counter--;
//   }
// }
//GetBuilder
// import 'package:get/get.dart';

// class Homecontroller extends GetxController {
//   int counter = 0;
//   void inc() {
//     counter++;
//     update();
//   }
//     void dec() {
//     counter--;
//     update();
//   }
// }
