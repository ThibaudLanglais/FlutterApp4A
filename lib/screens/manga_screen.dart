import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projet_4a/components/manga_card/manga_card.dart';
import 'package:jikan_api/jikan_api.dart';
import '../services/url_launcher_service.dart';
import '../services/utils.dart';
import '../components/manga_synopsis/manga_synopsis.dart';
import 'package:share_plus/share_plus.dart';


class MangaScreen extends StatefulWidget {
  const MangaScreen({super.key, this.manga, this.showText = false});

  final Manga? manga;
  final bool showText;

  @override
  State<MangaScreen> createState() => _MangaScreenState();
}

class _MangaScreenState extends State<MangaScreen> {

  final TextStyle synopsisStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: widget.manga!.url));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  content: Text("Lien copié dans le presse-papier"),
                  duration: Duration(seconds: 1),
                ));
              },
            ),
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                UrlLauncherService.openInBrowser(url: widget.manga!.url);
              },
            ),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.share(widget.manga!.url);
              },
            ),
          ],
          title: Text(widget.manga!.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        body: Expanded(
          child: Stack(
            children: [
              CachedNetworkImage(
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
                imageUrl: widget.manga!.imageUrl,
                placeholder: (context, url) => const Center(
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ))),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black,
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
                            MangaCard(manga: widget.manga!),
                            const Text("ouais",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        MangaSynopsis(synopsis: widget.manga!.synopsis!),
                        // Text(widget.manga!.synopsis!,
                        //     maxLines: null,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: synopsisStyle),
                        // if(Utils.hasTextOverflow(widget.manga!.synopsis!, synopsisStyle)) Text("dépasse", style: synopsisStyle)
                        // else Text("pas", style: synopsisStyle),
                      ])),
                ),
              )
            ],
          ),
        ));
  }
}
