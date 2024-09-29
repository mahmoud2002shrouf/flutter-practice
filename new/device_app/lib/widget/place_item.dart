import 'package:flutter/material.dart';
class PlaceItems extends StatelessWidget{
  const PlaceItems({super.key,required this.title});
  final String title;
  @override
  Widget build(context){
    return Scaffold(
      appBar:  AppBar(title: Text(title),),
      body: Center(
        child: Text(title),
      ),
    );
  }
}