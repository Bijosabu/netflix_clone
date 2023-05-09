// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/strings.dart';
// import 'package:netflixapp/core/constants/constants.dart';
import 'package:netflixapp/presentation/search/widgets/title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// const String imageUrl = 'assets/images/poster4.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 17),
          child: TitleWidget(title: 'Top Searches'),
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error while loading data'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is Empty'),
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TopSearchItemTile(
                      imageUrl:
                          "$imageAppendUrl${state.idleList[index].posterPath}",
                      title: state.idleList[index].title ?? 'The Office',
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 20);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: screenSize.width * 0.21,
          width: screenSize.width * 0.36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl!),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            title!,
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.roboto().fontFamily),
          ),
        ),
        Container(
          height: 50,
          width: 40,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    );
  }
}
