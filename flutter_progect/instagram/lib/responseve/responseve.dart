import 'package:flutter/material.dart';

class Responseve extends StatelessWidget {
  final Widget webScreen;
  final Widget mobileScreen;
const Responseve({ Key? key ,required this.webScreen,required this.mobileScreen}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth>600){
        return webScreen;
      }
      else{
        return mobileScreen;

      }
    },);
  }
}