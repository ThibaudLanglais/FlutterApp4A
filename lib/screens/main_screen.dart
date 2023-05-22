import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/classes/filters.dart';
import 'package:flutter_projet_4a/components/bottom_navigation_bar/bottom_navigation_container.dart';
import 'package:flutter_projet_4a/components/explore_filter_drawer/explore_filter_drawer.dart';
import 'package:flutter_projet_4a/screens/explore_screen.dart';
import 'package:flutter_projet_4a/screens/home_screen.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  String screenTitle = "Home";
  Widget currentScreen = HomeScreen();

  final PageStorageBucket bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Filters(),
      child: Scaffold(
        key: _scaffoldKey,
        drawer:
            currentScreen is ExploreScreen ? const ExploreFilterDrawer() : null,
        body: Scaffold(
          extendBody: true,
          body: PageStorage(bucket: bucket, child: currentScreen),
          bottomNavigationBar: BottomNavigationContainer(
              scaffoldKey: _scaffoldKey,
              setCurrentScreen: (screen, index) => setState(() {
                    currentScreen = screen;
                    currentTab = index;
                  }),
              currentIndex: currentTab),
        ),
      ),
    );
  }
}
