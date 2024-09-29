import 'package:get/get.dart';
class RebelderController extends  GetxController{
  var counter1=0.obs;
  var counter2=0.obs;

  void increment1(){
    counter1++;
  }

  void increment2(){
    counter2++;
  }

  void dec1(){
    counter1--;
  }

  void dec2(){
    counter1--;
  }
  int get sum=>counter1.value+counter2.value;

}