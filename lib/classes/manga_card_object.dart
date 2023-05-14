import 'package:jikan_api/jikan_api.dart';

class MangaCardObject {
  int malId;
  String title;
  String imageUrl;
  String? synopsis;

  MangaCardObject({
    required this.malId,
    required this.title,
    required this.imageUrl,
    this.synopsis,
  });

  factory MangaCardObject.fromManga(Manga manga) {
    return MangaCardObject(
      malId: manga.malId,
      title: manga.title,
      imageUrl: manga.imageUrl,
      synopsis: manga.synopsis,
    );
  }

  factory MangaCardObject.fromJson(Map<String, dynamic> json) {
    return MangaCardObject(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      synopsis: json['synopsis'],
    );
  }
}
