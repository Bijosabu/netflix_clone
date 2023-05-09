import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class NumberCardWidget extends StatelessWidget {
  final int index;
  // final String imageUrl;
  const NumberCardWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 180,
            ),
            Container(
              height: 180,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/poster1.jpg'))),
            ),
          ],
        ),
        Positioned(
          left: 15,
          top: 70,
          child: BorderedText(
            strokeWidth: 3.0,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  decorationColor: Colors.white,
                  fontSize: 100,
                  decorationThickness: 2,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
