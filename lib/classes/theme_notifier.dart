import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/services/themes.dart';
import 'package:flutter_projet_4a/services/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier(bool _isDark) {
    _currentTheme = _isDark ? darkTheme : lightTheme;
  }

  ThemeData _currentTheme = lightTheme;
  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_currentTheme == lightTheme) {
      _currentTheme = darkTheme;
      await prefs.setBool("darkTheme", true);
    } else {
      _currentTheme = lightTheme;
      await prefs.setBool("darkTheme", false);
    }

    Utils.setSystemUIOverlayStyle(_currentTheme.brightness);

    notifyListeners();
  }
}
