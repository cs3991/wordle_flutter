import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';
import 'package:wordle/keyboard/ui/keyboard_key.dart';

class LetterKey extends StatelessWidget {
  LetterKey({Key? key, required this.letter}) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) => InkWell(
            onTap: () => BlocProvider.of<GameCubit>(context).addLetter(letter),
            child: KeyboardKey(
              color: state.correctlyPlacedLetters.contains(letter)
                  ? Colors.green.withOpacity(0.30)
                  : state.wronglyPlacedLetters.contains(letter)
                      ? Colors.amber.withOpacity(0.30)
                      : state.notInWordLetters.contains(letter)
                          ? Colors.black.withOpacity(0.25)
                          : null,
              child: Text(
                letter,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
