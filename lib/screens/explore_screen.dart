import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/classes/filters.dart';
import 'package:flutter_projet_4a/classes/manga_card_object.dart';
import 'package:flutter_projet_4a/components/manga_card/manga_card.dart';
import 'package:flutter_projet_4a/services/jikan_service.dart';
import 'package:flutter_projet_4a/services/utils.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool clearEnabled = false;
  bool _isSearching = false;
  List<Manga> mangas = [];
  List<MangaCard> filteredMangas = [];

  void reset() {
    controller.clear();
  }

  @override
  void initState() {
    super.initState();
    Filters().addListener(() {
      if (_formKey.currentState?.validate() == true) {
        searchMangas(Filters());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    Filters().removeListener(() {});
  }

  void searchMangas(Filters filters) async {
    setState(() {
      _isSearching = true;
    });
    final result = await JikanService().searchManga(controller.text, filters);
    setState(() {
      _isSearching = false;
      mangas = result.asList();
    });
    filterMangas();
  }

  void filterMangas() async {
    List<Manga> result = mangas;
    final filters = Provider.of<Filters>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hideNSFW = prefs.getBool("hideNSFW") ?? true;

    if (filters.selectedType != null) {
      result = result.where((manga) {
        if (manga.type == null) return false;
        MangaType? typeAsEnum;
        for (var element in MangaType.values) {
          var enumValue = element.toString().toLowerCase();
          var mangaTypeValue = "MangaType.${manga.type}".toLowerCase();
          if (enumValue.contains(mangaTypeValue) ||
              mangaTypeValue.contains(enumValue)) {
            typeAsEnum = element;
          }
        }
        if (typeAsEnum == null) return false;
        if (hideNSFW && manga.type == "doujin") return false;
        return filters.selectedType == typeAsEnum;
      }).toList();
    }

    // Genres
    RegExp punctuation = RegExp(r'[^\w\s]');
    if (filters.selectedGenres.isNotEmpty) {
      result = result.where((manga) {
        if (manga.genres.isEmpty) return false;

        bool hasGenre = false;
        List<String> genres = [];
        for (var genre in manga.genres) {
          genres.add(genre.name.replaceAll(punctuation, "").toLowerCase());
        }

        for (var selectedGenre in filters.selectedGenres) {
          if (genres
              .contains(selectedGenre.toString().split('.')[1].toLowerCase())) {
            hasGenre = true;
            continue;
          }
        }

        return hasGenre;
      }).toList();
    }

    // NSFW protection
    if (hideNSFW) {
      result = result.where((manga) {
        bool isNSFW = false;
        for (var genre in manga.genres) {
          if (genre.name.toLowerCase() == "Hentai".toLowerCase()) isNSFW = true;
          if (genre.name.toLowerCase() == "Ecchi".toLowerCase()) isNSFW = true;
          if (genre.name.toLowerCase() == "Yuri".toLowerCase()) isNSFW = true;
          if (genre.name.toLowerCase() == "Harem".toLowerCase()) isNSFW = true;
        }

        return isNSFW ? false : true;
      }).toList();
    }

    setState(() {
      filteredMangas = result
          .map((manga) => MangaCard(
                manga: MangaCardObject.fromManga(manga),
                type: CardType.link,
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Filters>(builder: (context, filters, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    setState(() {
                      clearEnabled = value.isNotEmpty;
                    });
                  },
                  onFieldSubmitted: (value) {
                    searchMangas(filters);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: 'Search mangas...',
                    suffixIcon: IconButton(
                        onPressed: clearEnabled
                            ? () {
                                reset();
                              }
                            : null,
                        icon: const Icon(Icons.cancel)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        widget.scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.filter_alt_outlined),
                      label: const Text("Filter")),
                ),
                Expanded(
                    child: _isSearching
                        ? const Center(child: CircularProgressIndicator())
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GridView.count(
                              physics: const BouncingScrollPhysics(),
                              childAspectRatio: 125 / 175,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 3,
                              children: filteredMangas,
                            ),
                          ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
