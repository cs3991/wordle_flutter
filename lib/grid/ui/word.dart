import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';

import 'package:wordle/grid/ui/letter_tile.dart';
import 'package:wordle/grid/ui/shake_widget.dart';

class Word extends StatelessWidget {
  Word({Key? key, required this.wordIndex}) : super(key: key);

  final _shakeKey = GlobalKey<ShakeWidgetState>();
  final int wordIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
      listener: (context, state) {
        if (state.shaking[wordIndex]) {
          print('widget detected shaking');
          _shakeKey.currentState?.shake();
        }
      },
      child: ShakeWidget(
        key: _shakeKey,
        shakeOffset: 2,
        shakeDuration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              6,
              (letterIndex) => LetterTile(
                wordIndex: wordIndex,
                letterIndex: letterIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
