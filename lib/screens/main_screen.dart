import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/components/bottom_navigation_bar/bottom_navigation_container.dart';
import 'package:flutter_projet_4a/screens/home_screen.dart';
import 'package:flutter_projet_4a/screens/calendar_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Accueil"),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: PageStorage(bucket: bucket, child: currentScreen),
        bottomNavigationBar: BottomNavigationContainer(setCurrentScreen: (screen, index) => setState(() {
          currentScreen = screen;
          currentTab = index;
        }), currentIndex: currentTab),
      ),
    );
  }
}