import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflixapp/presentation/fastLaugh/widgets/scroll_video_list.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
      },
    );
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<FastLaughBloc>(context).add(
              const Initialize(),
            );
          },
          child: BlocBuilder<FastLaughBloc, FastLaughState>(
            builder: (context, state) {
              if (state.videosList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error while loading data'),
                );
              } else if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              } else {
                return PageView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                    state.videosList.length,
                    (index) {
                      return VideoListItemInheritedWidget(
                        movieData: state.videosList[index],
                        widget: ScrollVideoList(
                          index: index,
                          key: Key(index.toString()),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
