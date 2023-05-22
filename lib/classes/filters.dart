import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/services/utils.dart';
import 'package:jikan_api/jikan_api.dart';

class Filters extends ChangeNotifier {
  static final Filters _singleton = Filters._internal();

  factory Filters() {
    return _singleton;
  }

  Filters._internal();

  MangaType? selectedType;
  List<MangaGenres> selectedGenres = [];

  void setType(MangaType? type) {
    selectedType = type;
    notifyListeners();
  }

  void setGenre(MangaGenres genre) {
    if (selectedGenres.contains(genre)) {
      selectedGenres.remove(genre);
    } else {
      selectedGenres.add(genre);
    }
    notifyListeners();
  }
}
