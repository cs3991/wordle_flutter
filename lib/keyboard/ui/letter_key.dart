import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/common_widgets/constrained_with_flexible.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';
import 'package:wordle/keyboard/ui/keyboard_key.dart';

class LetterKey extends StatelessWidget {
  const LetterKey({
    Key? key,
    required this.letter,
    required this.constraint,
  }) : super(key: key);

  final BoxConstraints constraint;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return ConstrainedWidthFlexible(
      minWidth: 2,
      maxWidth: 50,
      flex: 1,
      flexSum: 10,
      outerConstraints: constraint,
      // ignore: avoid_redundant_argument_values
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) => InkWell(
            borderRadius: BorderRadius.circular(12),
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
