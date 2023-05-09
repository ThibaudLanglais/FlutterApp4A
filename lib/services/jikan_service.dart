import 'package:jikan_api/jikan_api.dart';

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
}
