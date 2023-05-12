import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/components/bottom_navigation_bar/bottom_navigation_container.dart';
import 'package:flutter_projet_4a/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  String screenTitle = "Accueil";

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Ubuntu"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(screenTitle,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: PageStorage(bucket: bucket, child: currentScreen),
        bottomNavigationBar: BottomNavigationContainer(
            setCurrentScreen: (screen, index, title) => setState(() {
                  currentScreen = screen;
                  currentTab = index;
                  screenTitle = title;
                }),
            currentIndex: currentTab),
      ),
    );
  }
}
