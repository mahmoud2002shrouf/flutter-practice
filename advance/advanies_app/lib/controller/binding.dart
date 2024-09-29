import 'package:advanies_app/controller/place_controler.dart';
import 'package:get/get.dart';

class Binding implements Bindings{
   @override 
  void dependencies() {
    Get.put(PlacesController(),permanent: true);

  }

}