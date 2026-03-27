import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';
//import 'package:toktik/infraestructure/models/local_video_model.dart';
//import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoRepository;

  bool initialLoading = true;
  List<VideosPost> videos = [
    //VideosPost(caption: "video 1", videoUrl: "www.123,com"),
  ];

  DiscoverProvider({required this.videoRepository});

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 2));
    /*
    final List<VideosPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

        */
    final newVideos = await videoRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
