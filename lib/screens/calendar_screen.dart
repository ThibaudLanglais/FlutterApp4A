import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/classes/daily_manga.dart';
import 'package:flutter_projet_4a/classes/manga_card_object.dart';
import 'package:flutter_projet_4a/components/manga_card/manga_card.dart';
import 'package:flutter_projet_4a/components/word_to_guess/word_to_guess.dart';
import 'package:flutter_projet_4a/services/jikan_service.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool isLoading = true;
  Manga? manga;
  List<Widget> titleAsWidgets = [];

  bool isDateOldEnough(String dailyManga) {
    DateTime date = DateTime.parse(jsonDecode(dailyManga)["date"]);
    return date.day != DateTime.now().day ||
        date.month != DateTime.now().month ||
        date.year != DateTime.now().year;
  }

  void loadDaily() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    var dailyManga = prefs.getString("daily");
    if (dailyManga == null || isDateOldEnough(dailyManga)) {
      Manga? result = await JikanService().getRandomManga();
      DailyManga dailyManga =
          DailyManga(mangaId: result.malId, date: DateTime.now());
      prefs.setString("daily", jsonEncode(dailyManga));

      Manga m = await JikanService.jikan.getManga(result.malId);
      setState(() {
        manga = m;
        isLoading = false;
      });
    } else {
      Manga m = await JikanService.jikan
          .getManga(DailyManga.fromJson(jsonDecode(dailyManga)).mangaId);
      setState(() {
        manga = m;
        isLoading = false;
      });
    }
    initWidgetList(manga!.titleEnglish ?? manga!.title);
  }

  void hanbleSubmit(String value) {
    List<Widget> newList = [];
    titleAsWidgets.forEach((element) {
      if (element is WordToGuess) {
        if (!element.hasBeenGuessed &&
            element.wordToGuess.toLowerCase() == value.toLowerCase()) {
          newList.add(WordToGuess(
              wordToGuess: element.wordToGuess, hasBeenGuessed: true));
        } else {
          newList.add(element);
        }
      } else {
        newList.add(element);
      }
    });

    setState(() {
      titleAsWidgets = newList;
    });
  }

  void initWidgetList(title) {
    String toGuess = manga!.titleEnglish ?? manga!.title;
    var punctuation = RegExp(r'[^\w\s]').allMatches(toGuess);
    var words = RegExp(r'[\w]+').allMatches(toGuess);

    // Print a mix of words and punctuation starting with the correct array
    // index.
    var i = 0;
    var j = 0;
    List<Widget> result = [];
    while (i < words.length && j < punctuation.length) {
      if (words.elementAt(i).start < punctuation.elementAt(j).start) {
        var parsedWord =
            toGuess.substring(words.elementAt(i).start, words.elementAt(i).end);
        result.add(WordToGuess(wordToGuess: parsedWord));
        result.add(Text(" "));
        i++;
      } else {
        result.add(Text(toGuess.substring(
            punctuation.elementAt(j).start, punctuation.elementAt(j).end)));
        j++;
      }
    }
    while (i < words.length) {
      var parsedWord =
          toGuess.substring(words.elementAt(i).start, words.elementAt(i).end);
      result.add(WordToGuess(wordToGuess: parsedWord));
      result.add(Text(" "));
      i++;
    }
    while (j < punctuation.length) {
      result.add(Text(toGuess.substring(
          punctuation.elementAt(j).start, punctuation.elementAt(j).end)));
      j++;
    }

    setState(() {
      titleAsWidgets = result;
    });
  }

  @override
  void initState() {
    super.initState();
    loadDaily();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Guess the manga")),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : manga == null
                ? const Center(child: Text("Error while loading daily manga"))
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.start,
                                children: titleAsWidgets),
                          ),
                          MangaCard(manga: MangaCardObject.fromManga(manga!)),
                          Spacer(),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter the title of the manga",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                )),
                            onFieldSubmitted: (value) => hanbleSubmit(value),
                          )
                        ],
                      ),
                    ),
                  ));
  }
}
