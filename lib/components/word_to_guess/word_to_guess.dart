import 'package:flutter/material.dart';

class WordToGuess extends StatelessWidget {
  WordToGuess(
      {super.key, required this.wordToGuess, this.hasBeenGuessed = false});

  String wordToGuess;

  bool hasBeenGuessed;

  String fakeTitle() {
    String result = "";
    for (int i = 0; i < wordToGuess.length; i++) {
      result += "_";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return hasBeenGuessed
        ? Text(wordToGuess)
        : Padding(
            padding: const EdgeInsets.all(2.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.75),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Text(
                fakeTitle(),
                style: TextStyle(color: Colors.transparent),
              ),
            ),
          );
  }
}
