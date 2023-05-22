import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projet_4a/classes/theme_notifier.dart';
import 'package:flutter_projet_4a/services/constants.dart';
import 'package:flutter_projet_4a/services/themes.dart';
import 'package:flutter_projet_4a/services/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkTheme = prefs.getBool("darkTheme") ?? false;

  runApp(MainApp(isDarkTheme: isDarkTheme));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isDarkTheme});

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(isDarkTheme),
      builder: (context, child) {
        final themeNotifier = Provider.of<ThemeNotifier>(context);
        Utils.setSystemUIOverlayStyle(themeNotifier.currentTheme.brightness);
        return MaterialApp(
          title: "Mangaled",
          theme: themeNotifier.currentTheme,
          home: const MainScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
