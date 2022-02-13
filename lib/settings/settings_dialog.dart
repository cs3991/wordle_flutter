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
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
            child: Text(
              'Plage de longueurs des mots à deviner',
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return Text(
                  'Entre ${state.minWordLength.toString()} et'
                  ' ${state.maxWordLength.toString()} lettres',
                  style: theme.textTheme.labelMedium
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return RangeSlider(
                  min: 5,
                  max: 10,
                  divisions: 10 - 5,
                  labels: RangeLabels(
                    state.minWordLength.toString(),
                    state.maxWordLength.toString(),
                  ),
                  values: RangeValues(
                    state.minWordLength.toDouble(),
                    state.maxWordLength.toDouble(),
                  ),
                  onChanged: (RangeValues values) {
                    context.read<SettingsCubit>().setMin(values.start.toInt());
                    context.read<SettingsCubit>().setMax(values.end.toInt());
                  },
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
