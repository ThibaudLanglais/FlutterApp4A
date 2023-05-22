import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utils {
  static bool hasTextOverflow(String text, TextStyle style,
      {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 3}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  // Json to map function
  static Map<String, dynamic> jsonToMap(dynamic json) {
    return json is String ? jsonDecode(json) : json;
  }

  static setSystemUIOverlayStyle(Brightness brightness) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: true,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
}

enum CardType { link, preview }

enum MangaGenres {
  Action,
  Adventure,
  AvantGarde,
  AwardWinning,
  BoysLove,
  Comedy,
  Drama,
  Fantasy,
  GirlsLove,
  Gourmet,
  Horror,
  Mystery,
  Romance,
  SciFi,
  SliceofLife,
  Sports,
  Supernatural,
  Suspense,
  Ecchi,
  Erotica,
  Hentai,
  AdultCast,
  Anthropomorphic,
  CGDCT,
  Childcare,
  CombatSports,
  Crossdressing,
  Delinquents,
  Detective,
  Educational,
  GagHumor,
  Gore,
  Harem,
  HighStakesGame,
  Historical,
  Isekai,
  Iyashikei,
  LovePolygon,
  MagicalSexShift,
  MahouShoujo,
  MartialArts,
  Mecha,
  Medical,
  Memoir,
  Military,
  Music,
  Mythology,
  OrganizedCrime,
  OtakuCulture,
  Parody,
  PerformingArts,
  Pets,
  Psychological,
  Racing,
  Reincarnation,
  ReverseHarem,
  RomanticSubtext,
  Samurai,
  School,
  Showbiz,
  Space,
  StrategyGame,
  SuperPower,
  Survival,
  TeamSports,
  TimeTravel,
  Vampire,
  VideoGame,
  Villainess,
  VisualArts,
  Workplace,
  Josei,
  Kids,
  Seinen,
  Shoujo,
  Shounen
}
