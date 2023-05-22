import 'dart:convert';

import 'package:flutter_projet_4a/classes/filters.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:http/http.dart' as http;
import 'package:jikan_api/src/model/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JikanService {
  static final JikanService _singleton = JikanService._internal();
  static final Jikan jikan = Jikan();

  factory JikanService() {
    return _singleton;
  }

  JikanService._internal();

  Future<BuiltList<Manga>> getTopManga() async {
    return await jikan.getTopManga();
  }

  Future<BuiltList<Manga>> searchManga(String query, Filters filters) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final hideNSFW = prefs.getBool("hideNSFW") ?? true;
    return await jikan.searchManga(query: query, rawQuery: "&sfw=$hideNSFW");
  }

  Future<Manga> getRandomManga() async {
    final response = await http.get(Uri.parse("$baseUrl/random/manga"));

    if (response.statusCode == 200) {
      return Manga.fromJson(jsonDecode(response.body)["data"]);
    } else {
      throw Exception('Failed to load manga');
    }
  }
}
