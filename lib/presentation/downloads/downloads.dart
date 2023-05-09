import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/presentation/widgets/app_bar_widget.dart';
import 'package:netflixapp/core/constants/constants.dart';
import 'package:netflixapp/application/downloads/downloads_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/strings.dart';
import 'package:netflixapp/infrastructure/search/search_repository.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});
  // final List images = [
  //   'assets/images/poster2.jpg',
  //   'assets/images/poster3.jpg',
  //   'assets/images/poster1.jpg'
  // ];
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context)
    //       .add(const DownloadsEvent.getDownloadsImages());
    // });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImages());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView(
          children: [
            sHBox20,
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Icon(
                  Icons.settings,
                  color: kWhite,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Smart Downloads',
                  style: TextStyle(
                      color: kWhite,
                      fontFamily: kFontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Introducing Downloads for You',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'We\'ll download a personalised selection of\nmovies and shows for you so there\'s always\nsomething to watch on your device',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            BlocBuilder<DownloadsBloc, DownloadsState>(
              builder: (context, state) {
                return SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.4),
                              radius: size.width * 0.31,
                            ),
                            NetwrkImageWidget(
                              height: size.width * 0.50,
                              images:
                                  "$imageAppendUrl${state.downloads[0].posterPath}",
                              margin: const EdgeInsets.only(left: 140),
                              angle: 10,
                            ),
                            NetwrkImageWidget(
                                height: size.width * 0.50,
                                angle: -10,
                                images:
                                    "$imageAppendUrl${state.downloads[1].posterPath}",
                                margin: const EdgeInsets.only(right: 140)),
                            NetwrkImageWidget(
                                height: size.width * 0.53,
                                angle: 0,
                                images:
                                    // "https://image.tmdb.org/t/p/w500/9JBEPLTPSm0d1mbEcLxULjJq9Eh.jpg",
                                    "$imageAppendUrl${state.downloads[2].posterPath}",
                                margin: const EdgeInsets.only(top: 18))
                          ],
                        ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.blueAccent[700],
                onPressed: () {},
                child: const Text(
                  'Set up',
                  style: TextStyle(
                      color: kWhite, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
                right: 60,
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.white.withOpacity(0.8),
                onPressed: () {},
                child: const Text(
                  'See what you can download',
                  style: TextStyle(
                      color: kBlack, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}

class NetwrkImageWidget extends StatelessWidget {
  const NetwrkImageWidget({
    super.key,
    required this.images,
    required this.margin,
    required this.angle,
    required this.height,
  });
  final EdgeInsets margin;
  final double angle;
  final String images;
  final double height;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 100,
      child: Container(
        margin: margin,
        width: size.width * 0.4,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(images),
            )),
      ),
    );
  }
}
