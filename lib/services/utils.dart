import 'dart:convert';

import 'package:flutter/material.dart';

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
}

enum CardType { link, preview }
