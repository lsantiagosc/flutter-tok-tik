import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scroll_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //se usa watch porque ser va a redibujar el widget cuando cambie de estado
    //pero tambien hay otros metodos como read (Ver documentacion provider)
    final discoverProvider = context.watch<DiscoverProvider>();
    //otra forma de poner a escuchar el provider requerido
    /*final discoverProvider = Provider.of<DiscoverProvider>(
      context,
      listen: false,
    );*/
    return Scaffold(
      body: discoverProvider.initialLoading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
          : VideoScrollView(videos: discoverProvider.videos),
    );
  }
}
