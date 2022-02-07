import 'package:flutter/material.dart';

import 'letter_tile.dart';

class Word extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LetterTile(),
          LetterTile(),
          LetterTile(),
          LetterTile(),
          LetterTile(),
          LetterTile(),
        ],
      ),
    );
  }
}
