import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';
import 'package:wordle/grid/ui/grid.dart';
import 'package:wordle/keyboard/ui/keyboard.dart';
import 'package:wordle/theme/brightness_cubit.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text('Wordle', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        toolbarHeight: 64,
        elevation: 0,
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: BlocBuilder<BrightnessCubit, Brightness>(
                builder: (context, brightness) {
                  return Icon(
                    brightness == Brightness.dark
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    color: Theme.of(context).colorScheme.onSurface,
                  );
                },
              ),
            ),
            onPressed: () {
              BlocProvider.of<BrightnessCubit>(context).switchBrightness();
            },
          ),
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocListener<GameCubit, GameState>(
        listener: (context, state) {
          if (state.won) {
            showDialog<String>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  alignment: Alignment.center,
                  titleTextStyle:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                  contentTextStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  actionsPadding: const EdgeInsets.all(20),
                  buttonPadding: const EdgeInsets.only(left: 8),
                  contentPadding:
                      const EdgeInsets.only(right: 24, left: 24, top: 16),
                  titlePadding:
                      const EdgeInsets.only(right: 24, left: 24, top: 24),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  elevation: 3,
                  title: Column(
                    children: const [
                      Icon(
                        Icons.celebration_rounded,
                        size: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Gagné !'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  content: Text(
                    'Vous avez gagné en ${state.currentWordIndex + 1} coups',
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        BlocProvider.of<GameCubit>(context).initGame();
                      },
                      child: Text(
                        'Rejouer',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                );
              },
              barrierDismissible: false,
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Grid(),
            Keyboard(),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
