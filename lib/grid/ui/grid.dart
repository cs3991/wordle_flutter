import 'package:flutter/material.dart';
import 'package:wordle/grid/ui/word.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Word(),
        Word(),
        Word(),
        Word(),
        Word(),
        Word(),
      ],
    );
  }
}
