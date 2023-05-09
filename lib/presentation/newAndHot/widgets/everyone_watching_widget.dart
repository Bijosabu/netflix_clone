import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../home/widgets/stack_button_widget.dart';

const String _sampleText =
    'Amid the daily grind in a coal mining town,poliics and power dynamics take a dangerous toll on a love triangle between three longtime friends';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width - 60,
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sHbox10,
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/lscape2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.1),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          sHBox20,
          Row(
            children: [
              Text(
                'Oblivion',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  fontFamily: kFontFamily,
                ),
              ),
              const Spacer(),
              const StackButtonWidget(
                icon: Icons.share,
                title: 'Share',
                iconSize: 24,
                fontSize: 12,
              ),
              sWbox20,
              const StackButtonWidget(
                icon: Icons.add,
                title: 'My List',
                iconSize: 24,
                fontSize: 12,
              ),
              sWbox20,
              const StackButtonWidget(
                icon: Icons.play_arrow,
                title: 'Play',
                iconSize: 24,
                fontSize: 12,
              ),
              sWbox10,
            ],
          ),
          // sHBox15,
          // const Text('Coming on friday'),
          sHbox10,
          const Text(
            'Oblivion',
            style: TextStyle(fontSize: 25),
          ),
          sHbox10,
          const Text(
            _sampleText,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
