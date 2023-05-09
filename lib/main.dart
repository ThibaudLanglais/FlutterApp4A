import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color.fromARGB(255, 9, 9, 10),
          fontFamily: 'Georgia'),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
