import 'package:flutter/material.dart';
import 'package:get_xapp/viws/counter.dart';
class ScreenOne extends StatelessWidget {
const ScreenOne({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text("counter"),),body: const Counter());
  }
}