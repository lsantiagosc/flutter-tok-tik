import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollView extends StatelessWidget {
  final List<VideosPost> videos;
  const VideoScrollView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    //el pageView toma todo el espacio disponible de la pantalla
    /* return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
        Container(color: Colors.black),
      ],
    );*/
    //se optimiza usando Builder, puesto que construirá los widgets dependiendo lo que se va mostrando en pantalla
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideosPost videosPost = videos[index];
        return Stack(
          children: [
            //Video player + gradiente
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videosPost.caption,
                videoUrl: videosPost.videoUrl,
              ),
            ),

            //botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videosPost),
            ),
          ],
        );
      },
    );
  }
}
