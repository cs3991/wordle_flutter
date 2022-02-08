import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';

class LetterTile extends StatelessWidget {
  final int wordIndex;
  final int letterIndex;

  const LetterTile(
      {Key? key, required this.wordIndex, required this.letterIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, gameState) {
          var letter = gameState.lettersMatrix[wordIndex][letterIndex];
          var status = gameState.statusMatrix[wordIndex][letterIndex];

          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            height: 56,
            width: 56,
            child: Center(
              child: Text(
                letter ?? '',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: status == LetterStatus.unknown
                        ? Theme.of(context).colorScheme.onTertiaryContainer
                        : status == LetterStatus.wrongSpot
                            ? Colors.amber
                            : status == LetterStatus.correctSpot
                                ? Colors.green
                                : Colors.black12),
              ),
            ),
          );
        },
      ),
    );
  }
}
