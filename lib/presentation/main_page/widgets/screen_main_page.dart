// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflixapp/presentation/home/ScreenHome.dart';
import 'package:netflixapp/presentation/downloads/downloads.dart';
import 'package:netflixapp/presentation/fastLaugh/fast_laugh.dart';
import 'package:netflixapp/presentation/newAndHot/new_and_hot.dart';
import 'package:netflixapp/presentation/search/search_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  List pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    const ScreenDownloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (context, index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
