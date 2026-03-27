// Se utiliza una clase abstracta porque no requiero instanciar la clase
import 'package:toktik/domain/entities/videos_post.dart';

abstract class VideoPostsDatasource {
  Future<List<VideosPost>> getTrendingVideosByPage(int page); //No se implementa
  Future<List<VideosPost>> getFavoriteVideosByUser(String userId);
}
