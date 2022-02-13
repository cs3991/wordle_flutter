import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';

class LetterTile extends StatelessWidget {
  const LetterTile({
    Key? key,
    required this.wordIndex,
    required this.letterIndex,
  }) : super(key: key);

  final int wordIndex;
  final int letterIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, gameState) {
          final letter = gameState.word!.length > letterIndex
              ? gameState.letterMatrix![wordIndex][letterIndex]
              : '';
          final status = gameState.word!.length > letterIndex
              ? gameState.statusMatrix![wordIndex][letterIndex]
              : LetterStatus.unknown;

          return Container(
            decoration: BoxDecoration(
              color: status == LetterStatus.unknown
                  ? Theme.of(context).colorScheme.tertiaryContainer
                  : status == LetterStatus.wrongSpot
                      ? Colors.amber.withOpacity(0.30)
                      : status == LetterStatus.correctSpot
                          ? Colors.green.withOpacity(0.30)
                          : Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(16),
            ),
            height: 56,
            // width: 56,
            child: Center(
              child: Text(
                letter ?? '',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onTertiaryContainer
                          .withOpacity(
                            (status == LetterStatus.notInWord) ? 0.3 : 1,
                          ),
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
