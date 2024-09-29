import "package:flutter/material.dart";

class startScreen extends StatelessWidget {
  const startScreen({super.key});
  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset("assets/images/quiz-logo.png", width: 300),
        ),
        Text("")
      ]),
    );
  }
}
