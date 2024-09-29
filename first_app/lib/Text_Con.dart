import 'package:flutter/material.dart';

class TextCon extends StatelessWidget {
  final String text;

  const TextCon(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}
