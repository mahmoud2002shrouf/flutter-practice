import 'package:flutter/material.dart';

class MaelItemTrait extends StatelessWidget {
  const MaelItemTrait({
    super.key,
    required this.lable,
    required this.icon,
  });
  final String lable;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        const SizedBox(
          width: 6,
        ),
        Text(lable,style:const TextStyle(color: Colors.white),)
      ],
    );
  }
}
