import 'package:flutter/material.dart';
// import 'package:first_app/Text_Con.dart';
import 'package:first_app/DiceRollar.dart';

var start = Alignment.topLeft;
var ends = Alignment.bottomRight;

class ContenerLiner extends StatelessWidget {
  const ContenerLiner({Key? key, required this.myColor}) : super(key: key);
  final List<Color> myColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: myColor,
          begin: start,
          end: ends,
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}
