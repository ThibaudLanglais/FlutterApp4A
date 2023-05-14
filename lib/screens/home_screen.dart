import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/classes/manga_card_object.dart';
import 'package:flutter_projet_4a/components/manga_card/manga_card.dart';
import 'package:flutter_projet_4a/services/jikan_service.dart';
import 'package:flutter_projet_4a/services/sql_helper.dart';
import 'package:jikan_api/jikan_api.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> bookmarks = [];

  void refreshBookmarks() async {
    print("refreshing bookmarks");
    final result = await SQLHelper.getMangas();
    setState(() {
      bookmarks.clear();
      bookmarks.addAll(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil"), actions: [
        Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              AdaptiveTheme.of(context).toggleThemeMode();
              AdaptiveTheme.of(context).persist();
            })
      ]),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                  title: Text(
                "Vos mangas suivis",
              )),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 176,
                  child: Builder(builder: (context) {
                    final mangaList = bookmarks.take(10);
                    if (mangaList.isNotEmpty) {
                      return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: mangaList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (BuildContext context, int index) =>
                              MangaCard(
                                  onNavigatorPop: refreshBookmarks,
                                  manga: MangaCardObject.fromJson(
                                      mangaList.elementAt(index))));
                    } else {
                      return const Center(
                          child: Text("No manga bookmarked 😔"));
                    }
                  })),
              const ListTile(
                title: Text("Suggestions"),
                subtitle: Text("Selon vos mangas suivis"),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 176,
                child: FutureBuilder(
                    future: JikanService().searchManga(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        final mangaList = snapshot.data!.take(10);
                        if (mangaList.isNotEmpty) {
                          return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: mangaList.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(width: 10),
                              itemBuilder: (BuildContext context, int index) =>
                                  MangaCard(
                                      onNavigatorPop: refreshBookmarks,
                                      manga: MangaCardObject.fromManga(
                                          mangaList.elementAt(index))));
                        } else {
                          return Text("No manga bookmarked");
                        }
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        ));
                      }
                    })),
              ),
            ],
          )),
    );
  }
}
