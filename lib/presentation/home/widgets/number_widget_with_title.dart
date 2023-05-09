import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/home/widgets/number_widget.dart';
import 'package:netflixapp/presentation/widgets/title_widget.dart';

class NumberWidgetWithTitle extends StatelessWidget {
  const NumberWidgetWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(4),
          child: MainTitleWidget(
            title: 'Top 10 TV Shows in India Today',
            fontsize: 18,
          ),
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.all(4),
                child: NumberCardWidget(
                  index: index,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
