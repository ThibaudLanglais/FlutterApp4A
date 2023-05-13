import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/screens/manga_screen.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MangaCard extends StatelessWidget {
  const MangaCard({super.key, this.manga});

  final Manga? manga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MangaScreen(manga: manga)) 
        );
      },
      child: Container(
        width: 125,
        height: 175,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(7))
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: CachedNetworkImage(
            imageUrl: manga!.imageUrl, 
            placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: Colors.white,)),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white, size: 50),
            fit: BoxFit.cover
          ),
        )
      )
    );
  }
}
