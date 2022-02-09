import 'package:flutter/material.dart';

import 'package:wordle/grid/ui/letter_tile.dart';

class Word extends StatelessWidget {
  const Word({Key? key, required this.wordIndex}) : super(key: key);

  final int wordIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          6,
              (letterIndex) => LetterTile(
            wordIndex: wordIndex,
            letterIndex: letterIndex,
          ),
        ),
      ),
    );
  }
}
