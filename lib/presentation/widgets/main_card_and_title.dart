import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/widgets/main_card.dart';
import 'package:netflixapp/presentation/widgets/title_widget.dart';

class MainCardWithTitle extends StatelessWidget {
  final String title;
  const MainCardWithTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: MainTitleWidget(
            title: title,
            fontsize: 18,
          ),
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              return const Padding(
                padding: EdgeInsets.all(4),
                child: MainCardWidget(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg'),
              );
            }),
          ),
        )
      ],
    );
  }
}
