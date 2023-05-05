import 'package:flutter/material.dart';
import 'package:flutter_projet_4a/screens/home_screen.dart';
import 'package:flutter_projet_4a/screens/calendar_screen.dart';
import 'package:flutter_projet_4a/screens/explore_screen.dart';
import 'package:flutter_projet_4a/screens/profile_screen.dart';

class BottomNavigationContainer extends StatefulWidget {
  
  const BottomNavigationContainer({super.key, required this.setCurrentScreen, required this.currentIndex});

  final Function(Widget, int) setCurrentScreen;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() => _NavigationState();

}

class _NavigationState extends State<BottomNavigationContainer>{

  List<MenuOption> menuOptions = [
    MenuOption(icon: Icons.home, destination: const HomeScreen(), index: 0),
    MenuOption(icon: Icons.calendar_month, destination: const CalendarScreen(), index: 1),
    MenuOption(icon: Icons.explore, destination: const ExploreScreen(), index: 2),
    MenuOption(icon: Icons.person, destination: const ProfileScreen(), index: 3),
  ];

  List<Widget> generateItems(){
    List<Widget> list = List.generate(
      menuOptions.length, 
      (index) {
        final option = menuOptions[index];
        return GestureDetector(
          onTap: () => {
            widget.setCurrentScreen(option.destination, option.index)
          },
          child: Container(
            height: 50,
            width: 50,
            // decoration: BoxDecoration(color: widget.currentIndex == option.index ? Colors.white12 : null, borderRadius: const BorderRadius.all(Radius.circular(13))),
            alignment: Alignment.center,
            child: Icon(option.icon, color: widget.currentIndex == option.index ? Colors.amber : Colors.white),
          )
        );
      }
    );
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 28, 29, 31),
        borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                  left: 50.0*widget.currentIndex + 10*(widget.currentIndex),
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.all(Radius.circular(13))),
                  )
                ),
                Wrap(
                  spacing: 10,
                  children: generateItems()
                ),
              ],
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.all(Radius.circular(13))),
              alignment: Alignment.center,
              child: const Icon(Icons.settings, color: Colors.white),
            ),
          ],
        )
    );
  }

}

class MenuOption {

  final IconData icon;
  final Widget destination;
  final int index;
  
  MenuOption({required this.icon, required this.destination, required this.index});
}