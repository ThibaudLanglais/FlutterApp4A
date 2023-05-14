import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prochaine sorties",
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Calendar", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
