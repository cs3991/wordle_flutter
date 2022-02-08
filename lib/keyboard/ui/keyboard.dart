import 'package:flutter/material.dart';
import 'package:wordle/keyboard/ui/icon_key.dart';

import 'keyboard_key.dart';
import 'letter_key.dart';

class Keyboard extends StatelessWidget {
  static const azertyLine1 = ['A', 'Z', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
  static const azertyLine2 = ['Q', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M'];
  static const azertyLine3 = ['W', 'X', 'C', 'V', 'B', 'N'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: azertyLine1.map((l) => LetterKey(letter: l)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: azertyLine2.map((l) => LetterKey(letter: l)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: azertyLine3
                .map((l) => LetterKey(letter: l) as KeyboardKey)
                .followedBy([
              IconKey(icon: Icons.backspace_outlined),
              IconKey(icon: Icons.arrow_forward_rounded),
            ]).toList(),
          ),
        ],
      ),
    );
  }
}
