import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../home/widgets/stack_button_widget.dart';

const String _sampleText =
    'Amid the daily grind in a coal mining town,poliics and power dynamics take a dangerous toll on a love triangle between three longtime friends';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: kFontFamily,
                    color: Colors.white.withOpacity(
                      0.7,
                    )),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    fontFamily: kFontFamily),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      'assets/images/lscape.jpeg',
                      fit: BoxFit.cover,
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
                    icon: Icons.notifications_none,
                    title: 'Remind me',
                    iconSize: 20,
                    fontSize: 12,
                  ),
                  sWbox20,
                  const StackButtonWidget(
                    icon: Icons.info,
                    title: 'info',
                    iconSize: 20,
                    fontSize: 12,
                  ),
                  sWbox10,
                ],
              ),
              sHBox15,
              const Text('Coming on friday'),
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
        ),
      ],
    );
  }
}
