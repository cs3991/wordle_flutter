import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({Key? key, this.flex = 1, required this.child, this.color})
      : super(key: key);

  final int flex;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return Ink(
            height: 50,
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: child,
            ),
          );
        },
      ),
    );
  }
}
