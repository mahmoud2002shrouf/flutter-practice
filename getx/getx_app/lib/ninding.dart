import 'package:get/get.dart';
import 'package:getx_app/controler/HomeController.dart';
import 'package:getx_app/controler/recontroller.dart';

class Binding implements Bindings{
  @override 
  void dependencies() {
    Get.put(Homecontroller(),permanent: true);
    Get.put(Recontroller(),permanent: true);

  }

}