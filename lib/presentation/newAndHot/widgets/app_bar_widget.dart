import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constants.dart';

class AppBarNewHot extends StatelessWidget {
  const AppBarNewHot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          'New & Hot',
          style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 28,
        ),
        sWbox20,
        Container(
          height: 30,
          width: 30,
          color: kBlue,
        ),
        sWbox20,
      ],
      bottom: TabBar(
        isScrollable: true,
        unselectedLabelColor: kWhite,
        indicator: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(30)),
        labelColor: kBlack,
        labelStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, fontFamily: kFontFamily),
        tabs: const [
          Tab(
            text: '🍿 Coming Soon',
          ),
          Tab(
            text: '👀 Everyone\'s watching',
          ),
        ],
      ),
    );
  }
}
