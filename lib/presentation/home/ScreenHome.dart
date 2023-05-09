import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/downloads/downloads_bloc.dart';
import 'package:netflixapp/presentation/home/widgets/number_widget_with_title.dart';
import 'package:netflixapp/presentation/widgets/main_card_and_title.dart';
import 'package:netflixapp/core/constants/constants.dart';
import 'package:netflixapp/presentation/home/widgets/home_screen_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              // print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    HomeScreenCard(),
                    sHBox20,
                    MainCardWithTitle(title: 'Released in the past year'),
                    sHBox20,
                    MainCardWithTitle(title: 'Continue Watching for Bijo'),
                    sHBox20,
                    NumberWidgetWithTitle(),
                    sHBox20,
                    MainCardWithTitle(title: 'Freshly Picked For You'),
                    sHBox20,
                    MainCardWithTitle(title: 'Military Movies'),
                    sHBox20,
                  ],
                ),
                scrollNotifier.value == true
                    ? const HomeScreenAppBar()
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    ));
  }
}

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      height: 90,
      width: double.infinity,
      color: Colors.black.withOpacity(0.3),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    'assets/images/nlogo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              sWbox20,
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 28,
                  width: 28,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'TV Shows',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Movies',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
