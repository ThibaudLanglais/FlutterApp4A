import 'dart:convert';

import 'package:jikan_api/jikan_api.dart';

class DailyManga {
  int mangaId;
  DateTime date;

  DailyManga({
    required this.mangaId,
    required this.date,
  });

  factory DailyManga.fromJson(Map<String, dynamic> json) {
    return DailyManga(
      mangaId: json['mangaId'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mangaId': mangaId,
      'date': date.toIso8601String(),
    };
  }
}
