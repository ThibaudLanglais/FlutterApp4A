// color: Color.fromARGB(255, 32, 86, 195),
// blue theme ca rend trop bien
import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/classes/filters.dart';
import 'package:flutter_projet_4a/screens/home_screen.dart';
import 'package:flutter_projet_4a/screens/calendar_screen.dart';
import 'package:flutter_projet_4a/screens/explore_screen.dart';
import 'package:flutter_projet_4a/screens/profile_screen.dart';
import 'package:flutter_projet_4a/screens/settings_screen.dart';

class BottomNavigationContainer extends StatefulWidget {
  const BottomNavigationContainer(
      {super.key,
      required this.setCurrentScreen,
      required this.currentIndex,
      required this.scaffoldKey});

  final Function(Widget, int) setCurrentScreen;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<BottomNavigationContainer> {
  List<MenuOption> menuOptions = [];

  @override
  void initState() {
    super.initState();
    menuOptions = [
      MenuOption(icon: Icons.home, destination: HomeScreen(), index: 0),
      MenuOption(
          icon: Icons.gamepad, destination: const CalendarScreen(), index: 1),
      MenuOption(
          icon: Icons.explore,
          destination: ExploreScreen(scaffoldKey: widget.scaffoldKey),
          index: 2),
    ];
  }

  List<Widget> generateItems() {
    List<Widget> list = List.generate(menuOptions.length, (index) {
      final option = menuOptions[index];
      return GestureDetector(
          onTap: () =>
              {widget.setCurrentScreen(option.destination, option.index)},
          child: Container(
            height: 50,
            width: 50,
            // decoration: BoxDecoration(color: widget.currentIndex == option.index ? Colors.white12 : null, borderRadius: const BorderRadius.all(Radius.circular(13))),
            alignment: Alignment.center,
            child: Icon(option.icon,
                color: widget.currentIndex == option.index
                    ? Theme.of(context).colorScheme.surface
                    : Theme.of(context).primaryColor.withOpacity(0.8)),
          ));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Stack(
              children: [
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic,
                    left:
                        50.0 * widget.currentIndex + 10 * (widget.currentIndex),
                    width: 50,
                    height: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                    )),
                Wrap(spacing: 10, children: generateItems()),
              ],
            ),
            GestureDetector(
              onTap: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => const SettingsScreen()))
                    .then((value) => {})
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(13))),
                alignment: Alignment.center,
                child:
                    Icon(Icons.settings, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ));
  }
}

class MenuOption {
  final IconData icon;
  final Widget destination;
  final int index;

  MenuOption(
      {required this.icon, required this.destination, required this.index});
}
