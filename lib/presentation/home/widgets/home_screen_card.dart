import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/home/widgets/stack_button_widget.dart';

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/poster3.jpg',
                ),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 15,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const StackButtonWidget(
                icon: Icons.add,
                title: 'Add',
              ),
              playButton(),
              const StackButtonWidget(
                icon: Icons.info,
                title: 'Info',
              )
            ],
          ),
        )
      ],
    );
  }

  TextButton playButton() {
    return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
        size: 25,
      ),
      label: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Text(
          'Play',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
