import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projet_4a/classes/manga_card_object.dart';
import 'package:flutter_projet_4a/components/manga_card/manga_card.dart';
import 'package:flutter_projet_4a/services/jikan_service.dart';
import 'package:flutter_projet_4a/services/sql_helper.dart';
import 'package:jikan_api/jikan_api.dart';
import '../services/url_launcher_service.dart';
import '../services/utils.dart';
import '../components/manga_synopsis/manga_synopsis.dart';
import 'package:share_plus/share_plus.dart';

class MangaScreen extends StatefulWidget {
  MangaScreen({super.key, required this.malId, this.showText = false});

  final int malId;
  final bool showText;

  @override
  State<MangaScreen> createState() => _MangaScreenState();
}

class _MangaScreenState extends State<MangaScreen> {
  Manga? manga;

  void refreshMangas() async {
    if (manga == null) {
      final Manga result = await JikanService.jikan.getManga(widget.malId);
      setState(() {
        manga = result;
      });
    }

    final result = await SQLHelper.getManga(manga!.malId);
    setState(() {
      isBookmarked = result.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshMangas();
  }

  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return manga == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: manga!.url));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      content: Text("Titre copié dans le presse-papier"),
                      duration: Duration(seconds: 2),
                    ));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.language),
                  onPressed: () {
                    UrlLauncherService.openInBrowser(url: manga!.url);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    Share.share(manga!.url);
                  },
                )
              ],
              title: Text(manga!.title),
              backgroundColor: Colors.transparent,
            ),
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                    imageUrl: manga!.imageUrl,
                    placeholder: (context, url) => const Center(
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          Theme.of(context).primaryColor,
                        ])),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SafeArea(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(children: [
                            Row(
                              children: [
                                MangaCard(
                                    manga: MangaCardObject.fromManga(manga!),
                                    type: CardType.preview),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: 10,
                                          children: [
                                            for (var author in manga!.authors)
                                              Text(author.name)
                                          ],
                                        )
                                      ],
                                    ))
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                  style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(16.0)),
                                  ),
                                  onPressed: () async {
                                    // await SQLHelper.destroy();
                                    if (isBookmarked) {
                                      await SQLHelper.deleteManga(manga!.malId);
                                    } else {
                                      await SQLHelper.insertManga(
                                          Utils.jsonToMap(manga!.toJson()));
                                    }
                                    refreshMangas();
                                  },
                                  icon: Icon(isBookmarked
                                      ? Icons.bookmark_remove_outlined
                                      : Icons.bookmark_add_outlined),
                                  label: Text(isBookmarked
                                      ? "Remove from bookmarks"
                                      : "Add to bookmarks")),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: MangaSynopsis(synopsis: manga!.synopsis!),
                            ),
                          ])),
                    ),
                  )
                ],
              ),
            ));
  }
}
