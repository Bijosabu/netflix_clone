import 'package:flutter/material.dart';

class StackButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double fontSize;
  const StackButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize = 25,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: Colors.white,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
