import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/components/manga_card/manga_card.dart';
import 'package:flutter_projet_4a/services/jikan_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final jikan = JikanService();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const ListTile(
              title: Text("Vos mangas suivis",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 176,
              child: FutureBuilder(
                  future: JikanService().getTopManga(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final mangaList = snapshot.data!.take(10);
                      return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: mangaList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (BuildContext context, int index) =>
                              MangaCard(manga: mangaList.elementAt(index)));
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ));
                    }
                  })),
            ),
            const ListTile( 
              title: Text("Suggestions",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text("Selon vos mangas suivis",
                  style: TextStyle(color: Colors.white)),
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
                      return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: mangaList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (BuildContext context, int index) =>
                              MangaCard(manga: mangaList.elementAt(index)));
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ));
                    }
                  })),
            ),
          ],
        ));
  }
}
