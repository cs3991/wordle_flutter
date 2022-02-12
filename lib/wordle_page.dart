import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/game_logic/cubit/game_cubit.dart';
import 'package:wordle/grid/ui/grid.dart';
import 'package:wordle/keyboard/ui/keyboard.dart';
import 'package:wordle/settings_dialog.dart';
import 'package:wordle/theme/brightness_cubit.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: BlocProvider.of<GameCubit>(context).handleKeyboardEvent,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text('Wordle', style: Theme.of(context).textTheme.titleLarge),
          centerTitle: true,
          toolbarHeight: 64,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              BlocProvider.of<GameCubit>(context).initGame();
            },
            icon: Icon(
              Icons.refresh_rounded,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
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
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return SettingsDialog();
                  },
                );
              },
            ),
          ],
        ),
        body: BlocListener<GameCubit, GameState>(
          listener: (context, state) {
            if (state.won || state.lost) {
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
                      children: [
                        Icon(
                          state.won
                              ? Icons.celebration_rounded
                              : Icons.sentiment_dissatisfied_rounded,
                          size: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(state.won ? 'Gagné !' : 'Perdu'),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    content: Text(
                      state.won
                          ? 'Vous avez trouvé ${state.word} en '
                              '${state.currentWordIndex + 1} coups'
                          : 'Le mot à deviner était ${state.word}',
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
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Grid(),
              Keyboard(),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
