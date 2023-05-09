import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class MangaCard extends StatelessWidget {
  const MangaCard({super.key, this.manga});

  final Manga? manga;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Colors.black54,
          image: DecorationImage(
              image: NetworkImage(manga!.imageUrl), fit: BoxFit.cover)),
      child: Column(
        children: [
          // Text(manga!.title, style: TextStyle(color: Colors.white)),
          // Text(manga!.type.toString(), style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
