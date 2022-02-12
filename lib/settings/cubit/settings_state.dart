part of 'settings_cubit.dart';

class SettingsState {
  SettingsState(
    this.maxWordLength,
    this.minWordLength,
    this.possibleWordsNumber,
  );

  SettingsState.initial()
      : maxWordLength = 10,
        minWordLength = 5,
        possibleWordsNumber = 7000;

  final int maxWordLength;
  final int minWordLength;
  final int possibleWordsNumber;

  SettingsState copyWith({
    int? maxWordLength,
    int? minWordLength,
    int? possibleWordsNumber,
  }) {
    return SettingsState(
      maxWordLength ?? this.maxWordLength,
      minWordLength ?? this.minWordLength,
      possibleWordsNumber ?? this.possibleWordsNumber,
    );
  }
}
