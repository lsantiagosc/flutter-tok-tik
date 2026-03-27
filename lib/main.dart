import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infraestructure/datasources/local_videos_datasource_impl.dart';
import 'package:toktik/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(
      videoPostsDatasource: LocalVideosDatasourceImpl(),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //Ejecuta inmediatamente el provider, por defecto viene en true (plazy = perezozo = no ejecuta de inmediato)
          lazy: false,
          create: (_) =>
              DiscoverProvider(videoRepository: videoPostRepository)
                ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const Scaffold(
          //appBar: AppBar(title: const Text('TokTik'), centerTitle: true),
          body: DiscoverScreen(),
        ),
      ),
    );
  }
}
