import 'package:flutter/material.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';
import 'package:wordle/grid/ui/word.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        GameState.WORD_COUNT,
        (wordIndex) => Word(wordIndex: wordIndex),
      ),
    );
  }
}
