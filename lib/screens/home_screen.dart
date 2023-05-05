import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Home', style: TextStyle(color: Colors.white)),
          ),
        ],
      )
    );
  }

}