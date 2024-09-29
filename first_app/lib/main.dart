import 'package:flutter/material.dart';
import './cont.dart';

void main() {
  List<Color> myColors = const [
    Color.fromARGB(255, 20, 56, 102),
    Colors.deepPurpleAccent,
    Colors.blue
  ];
  runApp(
    MaterialApp(
      home: Scaffold(body: ContenerLiner(myColor: myColors)),
    ),
  );
}
