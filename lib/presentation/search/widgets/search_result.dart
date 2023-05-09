import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/strings.dart';
import 'package:netflixapp/presentation/search/widgets/title.dart';
import 'package:netflixapp/core/constants/constants.dart';
import 'package:netflixapp/presentation/widgets/main_card.dart';

class SearchResultWidget extends StatelessWidget {
  // final String? imageUrl;
  const SearchResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 12),
          child: TitleWidget(title: 'Movies & TV'),
        ),
        const SizedBox(),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 1 / 1.4,
                shrinkWrap: true,
                children: List.generate(
                  state.searchResult.length,
                  (index) {
                    return MainCardWidget(
                      imageUrl:
                          "$imageAppendUrl${state.searchResult[index].posterPath}",
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
