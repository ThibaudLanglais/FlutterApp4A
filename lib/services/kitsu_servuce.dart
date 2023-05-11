import 'dart:convert';

import '../api_classes/kitsu_search_response.dart';
import 'package:http/http.dart' as http;

class KitsuService {
  static final KitsuService _singleton = KitsuService._internal();
  static const baseUrl = "https://kitsu.io/api/edge";

  factory KitsuService() {
    return _singleton;
  }

  KitsuService._internal();

  static Future<KitsuSearchResponse> getTopManga(
      {required String query}) async {
    final response = await http
        .get(Uri.parse("$baseUrl/manga?filter[text]=$query&page%5Blimit%5D=1"));
    if (response.statusCode == 200) {
      return KitsuSearchResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load manga');
    }
  }
}
