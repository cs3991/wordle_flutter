import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';
import 'package:wordle/keyboard/ui/icon_key.dart';

import 'package:wordle/keyboard/ui/keyboard_key.dart';
import 'package:wordle/keyboard/ui/letter_key.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

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
            // ignore: unnecessary_cast
                .map((l) => LetterKey(letter: l) as KeyboardKey)
                .followedBy([
              IconKey(
                icon: Icons.backspace_outlined,
                onPress: (context) =>
                    BlocProvider.of<GameCubit>(context).deleteLetter(),
              ),
              IconKey(
                icon: Icons.arrow_forward_rounded,
                onPress: (context) =>
                    BlocProvider.of<GameCubit>(context).submitWord(),
              ),
            ]).toList(),
          ),
        ],
      ),
    );
  }
}
