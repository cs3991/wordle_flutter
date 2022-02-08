import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';
import 'package:wordle/keyboard/ui/keyboard_key.dart';

class LetterKey extends KeyboardKey {
  final String letter;

  LetterKey({Key? key, required this.letter})
      : super(
            key: key,
            flex: 1,
            onPress: (context) {
              BlocProvider.of<GameCubit>(context).addLetter(letter);
            });

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
