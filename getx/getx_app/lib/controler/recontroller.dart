import 'package:get/get.dart';

class Recontroller extends GetxController{
  int counter1=0;
  int counter2=0;
  void inc1(){
    counter1++;
    update();
  }
  void dec1(){
    counter1--;
    update();
  }
  void inc2(){
    counter2++;
    update();
  }
  void dec2(){
    counter2--;
    update();
  }
  int get sum{
    return counter1+counter2;
  }

  
}