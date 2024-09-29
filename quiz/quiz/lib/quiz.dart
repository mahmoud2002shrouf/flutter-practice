import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
            
        decoration:const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 125, 6, 146),
          Color.fromARGB(255, 171, 70, 189),
          Color.fromARGB(255, 177, 119, 187)
        ])),
        child:const startScreen() ,
      )),
    );
  }
}
