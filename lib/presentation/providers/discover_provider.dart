import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  //todo: Repository y DataSource

  bool initialLoading = true;
  List<VideosPost> videos = [
    //VideosPost(caption: "video 1", videoUrl: "www.123,com"),
  ];

  Future<void> loadNextPage() async {
    //await Future.delayed(const Duration(seconds: 2));

    final List<VideosPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
