import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/classes/manga_card_object.dart';
import 'package:flutter_projet_4a/screens/manga_screen.dart';
import 'package:flutter_projet_4a/services/utils.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MangaCard extends StatelessWidget {
  const MangaCard(
      {super.key,
      required this.manga,
      this.type = CardType.link,
      this.onNavigatorPop});

  final MangaCardObject manga;
  final CardType type;
  final Function? onNavigatorPop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (type == CardType.link) {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MangaScreen(malId: manga.malId)))
                .then((value) => {
                      if (onNavigatorPop != null) {onNavigatorPop!()}
                    });
          }
        },
        child: Container(
            width: 125,
            height: 175,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground,
                    width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(7))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CachedNetworkImage(
                  imageUrl: manga!.imageUrl,
                  placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
                  errorWidget: (context, url, error) => Icon(Icons.error,
                      color: Theme.of(context).colorScheme.error, size: 50),
                  fit: BoxFit.cover),
            )));
  }
}
