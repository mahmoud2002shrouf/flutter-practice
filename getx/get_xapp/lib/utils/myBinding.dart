import 'package:get/get.dart';
import 'package:get_xapp/controlar/home_controlar.dart';
import 'package:get_xapp/controlar/rebilderController.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put( HomeController());
    Get.put( RebelderController());

    }
}