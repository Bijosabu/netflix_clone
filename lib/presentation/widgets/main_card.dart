import 'package:flutter/material.dart';

// const String imageUrl = 'assets/images/poster1.jpg';

class MainCardWidget extends StatelessWidget {
  final String imageUrl;
  const MainCardWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Container(
      // height: 180,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
