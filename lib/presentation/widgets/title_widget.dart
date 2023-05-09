import 'package:flutter/material.dart';

class MainTitleWidget extends StatelessWidget {
  final String title;
  final double fontsize;
  const MainTitleWidget(
      {super.key, required this.title, required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
