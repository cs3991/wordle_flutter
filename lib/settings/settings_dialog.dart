import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/settings/cubit/settings_cubit.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text('Préférences', style: theme.textTheme.titleLarge),
        centerTitle: true,
        toolbarHeight: 64,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close_rounded,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(
              'Longueur minimale des mots',
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return Slider(
                  onChanged: (value) =>
                      context.read<SettingsCubit>().setMin(value.toInt()),
                  value: state.minWordLength.toDouble(),
                  min: 5,
                  max: state.maxWordLength.toDouble(),
                  divisions: state.maxWordLength - 5 == 0
                      ? 1
                      : state.maxWordLength - 5,
                  label: state.minWordLength.toString(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(
              'Longueur maximale des mots',
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return Slider(
                  onChanged: (value) =>
                      context.read<SettingsCubit>().setMax(value.toInt()),
                  value: state.maxWordLength.toDouble(),
                  min: state.minWordLength.toDouble(),
                  max: 10,
                  divisions: 10 - state.minWordLength == 0
                      ? 1
                      : 10 - state.minWordLength,
                  label: state.maxWordLength.toString(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(
              'Difficulté des mots à deviner',
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return Slider(
                  onChanged: (value) => context
                      .read<SettingsCubit>()
                      .setPossibleNumber(value.toInt()),
                  value: state.possibleWordsNumber.toDouble(),
                  min: 1000,
                  max: 15000,
                  divisions: 10,
                  label: state.possibleWordsNumber < 3000
                      ? 'Facile'
                      : state.possibleWordsNumber < 7000
                          ? 'Intermédiaire'
                          : state.possibleWordsNumber < 11000
                              ? 'Difficile'
                              : 'Hardcore',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
