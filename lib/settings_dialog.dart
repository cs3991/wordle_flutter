import 'package:flutter/material.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  int maxWordLength = 10;
  int minWordLength = 5;
  int possibleWordsNumber = 7000;

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
            child: Text('Longueur minimale des mots',
                style: theme.textTheme.labelLarge),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Slider(
              onChanged: (value) => setState(() {
                minWordLength = value.toInt();
              }),
              value: minWordLength.toDouble(),
              min: 5,
              max: maxWordLength.toDouble(),
              divisions: maxWordLength - 5 == 0 ? 1 : maxWordLength - 5,
              label: minWordLength.toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text('Longueur maximale des mots',
                style: theme.textTheme.labelLarge),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Slider(
              onChanged: (value) => setState(() {
                maxWordLength = value.toInt();
              }),
              value: maxWordLength.toDouble(),
              min: minWordLength.toDouble(),
              max: 10,
              divisions: 10 - minWordLength == 0 ? 1 : 10 - minWordLength,
              label: maxWordLength.toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text('Difficulté des mots à deviner',
                style: theme.textTheme.labelLarge),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Slider(
              onChanged: (value) => setState(() {
                possibleWordsNumber = value.toInt();
              }),
              value: possibleWordsNumber.toDouble(),
              min: 1000,
              max: 15000,
              divisions: 10,
              label: possibleWordsNumber < 3000
                  ? 'Facile'
                  : possibleWordsNumber < 7000
                      ? 'Intermédiaire'
                      : possibleWordsNumber < 11000
                          ? 'Difficile'
                          : 'Hardcore',
            ),
          ),
        ],
      ),
    );
  }
}
