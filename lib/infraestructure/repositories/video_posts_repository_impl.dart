import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/videos_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostsDatasource videoPostsDatasource;

  VideoPostsRepositoryImpl({required this.videoPostsDatasource});

  @override
  Future<List<VideosPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideosPost>> getTrendingVideosByPage(int page) {
    return videoPostsDatasource.getTrendingVideosByPage(page);
  }
}
