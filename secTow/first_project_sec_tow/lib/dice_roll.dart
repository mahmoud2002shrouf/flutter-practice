import 'dart:math';

import 'package:flutter/material.dart';

final randomize = Random();

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});
  @override
  State<DiceRoll> createState() {
    return _DiceRolls();
  }
}

class _DiceRolls extends State<DiceRoll> {
  var diceRooler = 2;
  void onDrow() {
    setState(() {
      diceRooler = randomize.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/img/dice-$diceRooler.png",
          width: 200,
        ),
        const SizedBox(
          height: 100,
        ),
        OutlinedButton(
          onPressed: onDrow,
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              backgroundColor: const Color.fromARGB(197, 0, 0, 0)),
          child: const Text(
            "Roll Dice",
            style: TextStyle(
              color: Color.fromARGB(197, 255, 255, 255),
              fontSize: 25,
            ),
          ),
        )
      ],
    );
  }
}
