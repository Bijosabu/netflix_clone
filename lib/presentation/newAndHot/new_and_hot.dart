// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/core/constants/constants.dart';
import 'package:netflixapp/presentation/newAndHot/widgets/app_bar_widget.dart';
import 'package:netflixapp/presentation/newAndHot/widgets/coming_soon_widget.dart';

// import '../../core/colors/colors.dart';
import '../home/widgets/stack_button_widget.dart';
import 'widgets/everyone_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBarNewHot(),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return Column(
      children: [
        sHbox10,
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ComingSoonWidget();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return EveryonesWatchingWidget();
      },
    );
  }
}
