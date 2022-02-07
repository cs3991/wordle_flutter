import 'package:flutter/material.dart';
import 'package:wordle/keyboard/ui/keyboard_key.dart';

class LetterKey extends KeyboardKey {
  final String letter;

  const LetterKey({Key? key, required this.letter}) : super(key: key, flex: 1);

  @override
  Widget builder(BuildContext context) {
    return Text(
      letter,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
    );
  }
}
