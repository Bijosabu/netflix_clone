import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 28,
              ),
              sWbox20,
              Container(
                height: 26,
                width: 26,
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
