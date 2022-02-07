import 'package:flutter/material.dart';
import 'package:wordle/keyboard/ui/icon_key.dart';

import 'keyboard_key.dart';
import 'letter_key.dart';

class Keyboard extends StatelessWidget {
  static const azertyLine1 = ['a', 'z', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'];
  static const azertyLine2 = ['q', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm'];
  static const azertyLine3 = ['w', 'x', 'c', 'v', 'b', 'n'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: azertyLine1.map((l) => LetterKey(letter: l)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: azertyLine2.map((l) => LetterKey(letter: l)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: azertyLine3
                .map((l) => LetterKey(letter: l) as KeyboardKey)
                .followedBy([
              IconKey(icon: Icons.arrow_back_ios_rounded),
              IconKey(icon: Icons.send_rounded),
            ]).toList(),
          ),
        ],
      ),
    );
  }
}
