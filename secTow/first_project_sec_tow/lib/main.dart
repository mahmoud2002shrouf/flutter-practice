import 'package:first_project_sec_tow/Gradiant-Contaner.dart';
import 'package:flutter/material.dart';

void main() {
  const List<Color> list = [
    Color.fromARGB(255, 1, 9, 34),
    Color.fromARGB(255, 154, 19, 136),
    Color.fromARGB(255, 65, 45, 100),
  ];
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradiantContaner(colors: list),
      ),
    ),
  );
}
