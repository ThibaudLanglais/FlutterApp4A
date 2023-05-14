import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projet_4a/services/constants.dart';
import 'package:flutter_projet_4a/services/themes.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(primaryColor: Colors.white),
      dark: ThemeData(
        fontFamily: 'Ubuntu',
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
        colorScheme: const ColorScheme.dark(
            background: Colors.black,
            brightness: Brightness.dark,
            secondary: Colors.amber),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.transparent,
            actionsIconTheme: IconThemeData(color: Colors.white)),
        textTheme:
            const TextTheme(titleLarge: TextStyle(fontFamily: 'Unbounded')),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.amber))),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        themeMode: ThemeMode.dark,
        theme: theme,
        darkTheme: darkTheme,
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
