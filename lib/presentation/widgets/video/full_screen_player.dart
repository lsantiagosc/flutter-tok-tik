import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();

    videoController = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: videoController.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        } else {
          return GestureDetector(
            onTap: () {
              if (videoController.value.isPlaying) {
                videoController.pause();
                return;
              }
              videoController.play();
            },
            child: AspectRatio(
              aspectRatio: videoController.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(videoController),
                  //Gradiente
                  VideoBackground(stops: [0.8, 1.0]),
                  //Texto
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(caption: widget.caption),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tittleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width,
      child: Text(caption, maxLines: 2, style: tittleStyle),
    );
  }
}
