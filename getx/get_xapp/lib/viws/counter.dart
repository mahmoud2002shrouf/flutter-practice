import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_xapp/controlar/home_controlar.dart';
class Counter extends StatelessWidget {
const Counter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
      HomeController controlar =Get.find();

    return Center(
        child: Obx( () {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {controlar.increment();}, icon: const Icon(Icons.add)),
                Text('${controlar.counter.value}'),
                IconButton(onPressed: () {controlar.decres();}, icon: const Icon(Icons.remove)),
              ],
            );
          }
        ),
      );
  }
}