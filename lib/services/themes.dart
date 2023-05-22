import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/services/constants.dart';

bool useMaterial3 = true;

final titleTextStyle = TextStyle(
    fontFamily: 'Unbounded', color: Colors.white, fontSize: textSize4);

final bodyTextStyle =
    TextStyle(fontFamily: 'Ubuntu', color: Colors.white, fontSize: textSize2);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Ubuntu',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.light(
      onPrimary: Color.fromARGB(255, 32, 86, 195),
      primary: Color.fromARGB(255, 32, 86, 195),
      background: Colors.white,
      secondary: Color.fromARGB(255, 52, 106, 216),
      primaryContainer: Color.fromARGB(255, 32, 86, 195),
      tertiary: Colors.black),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      actionsIconTheme: IconThemeData(color: Colors.black)),
  textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'Unbounded', color: Color.fromARGB(255, 32, 86, 195))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 32, 86, 195)))),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Ubuntu',
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(
      onPrimary: Colors.white,
      primary: Colors.amber,
      background: Colors.black,
      secondary: Colors.amber.shade900,
      primaryContainer: const Color.fromARGB(255, 28, 29, 31),
      tertiary: Colors.white,
      error: Colors.red),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      actionsIconTheme: IconThemeData(color: Colors.white)),
  textTheme: const TextTheme(titleLarge: TextStyle(fontFamily: 'Unbounded')),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.amber))),
);
