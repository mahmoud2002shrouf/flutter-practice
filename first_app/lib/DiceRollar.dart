import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerstate();
  }
}

class _DiceRollerstate extends State<DiceRoller> {
  var activedice = 2;
  void change() {
    print(num);
    setState(() {
      activedice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$activedice.png',
          width: 200,
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton(
          onPressed: change,
          child: const Text('Roll Dice'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            textStyle: const TextStyle(fontSize: 22),
          ),
        )
      ],
    );
  }
}
