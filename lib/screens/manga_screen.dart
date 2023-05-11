import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jikan_api/jikan_api.dart';
import '../services/url_launcher_service.dart';
import 'package:share_plus/share_plus.dart';


class MangaScreen extends StatefulWidget {
  const MangaScreen({super.key, this.manga});

  final Manga? manga;

  @override
  State<MangaScreen> createState() => _MangaScreenState();
}

class _MangaScreenState extends State<MangaScreen> {
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
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Stack(
            children: [
              CachedNetworkImage(
                width: double.infinity,
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
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter, 
                    end: Alignment.bottomCenter, 
                    colors: [
                    Colors.transparent,
                    Colors.black,
                    ])
                ),
              )
            ],
          ),
          )      
        ],
      )
    );
  }
}