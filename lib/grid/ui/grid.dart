import 'package:flutter/material.dart';
import 'package:wordle/grid/ui/word.dart';

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(6, (wordIndex) => Word(wordIndex: wordIndex)),
    );
  }
}
