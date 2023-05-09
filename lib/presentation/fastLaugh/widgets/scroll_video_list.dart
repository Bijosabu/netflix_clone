import 'package:flutter/material.dart';
import 'package:netflixapp/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflixapp/core/constants/constants.dart';
import 'package:netflixapp/core/strings.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget({
    required this.widget,
    required this.movieData,
  }) : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class ScrollVideoList extends StatelessWidget {
  final int index;
  const ScrollVideoList({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videourl = videoUrls[index % videoUrls.length];
    return Stack(
      children: [
        FastLaughVIdeoPlayer(
          videourl: videourl,
          onStateChanged: (isPlaying) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageAppendUrl$posterPath'),
                    ),
                    sHBox15,
                    const VideoActionWidget(
                      title: 'LOL',
                      icon: Icons.emoji_emotions,
                    ),
                    const VideoActionWidget(
                      title: 'My List',
                      icon: Icons.add,
                    ),
                    GestureDetector(
                      onTap: () {
                        Share.share(posterPath!);
                      },
                      child: const VideoActionWidget(
                        title: 'Share',
                        icon: Icons.share,
                      ),
                    ),
                    const VideoActionWidget(
                      title: 'Play',
                      icon: Icons.play_arrow,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const VideoActionWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class FastLaughVIdeoPlayer extends StatefulWidget {
  final String videourl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVIdeoPlayer(
      {super.key, required this.videourl, required this.onStateChanged});

  @override
  State<FastLaughVIdeoPlayer> createState() => _FastLaughVIdeoPlayerState();
}

class _FastLaughVIdeoPlayerState extends State<FastLaughVIdeoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videourl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
