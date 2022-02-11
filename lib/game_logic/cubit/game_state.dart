part of 'game_cubit.dart';

enum LetterStatus { unknown, notInWord, wrongSpot, correctSpot }

@immutable
class GameState {
  const GameState({
    required this.word,
    required this.currentWordIndex,
    required this.letterMatrix,
    required this.statusMatrix,
    required this.won,
    required this.lost,
    required this.correctlyPlacedLetters,
    required this.wronglyPlacedLetters,
    required this.notInWordLetters,
    required this.shaking,
  });

  GameState.initial()
      : word = null,
        letterMatrix = null,
        statusMatrix = null,
        won = false,
        lost = false,
        currentWordIndex = 0,
        correctlyPlacedLetters = <String>{},
        wronglyPlacedLetters = <String>{},
        notInWordLetters = <String>{},
        shaking = List<bool>.filled(WORD_COUNT, false);

  static const int WORD_COUNT = 6;
  final String? word;
  final List<List<String?>>? letterMatrix;
  final List<List<LetterStatus>>? statusMatrix;
  final int currentWordIndex;
  final bool won;
  final bool lost;
  final Set<String> correctlyPlacedLetters;
  final Set<String> wronglyPlacedLetters;
  final Set<String> notInWordLetters;
  final List<bool> shaking;

  GameState copyWith({
    String? word,
    List<List<String?>>? letterMatrix,
    List<List<LetterStatus>>? statusMatrix,
    bool? won,
    bool? lost,
    int? currentWordIndex,
    Set<String>? correctlyPlacedLetters,
    Set<String>? wronglyPlacedLetters,
    Set<String>? notInWordLetters,
    List<bool>? shaking,
  }) {
    return GameState(
      word: word ?? this.word,
      letterMatrix: letterMatrix ?? this.letterMatrix,
      statusMatrix: statusMatrix ?? this.statusMatrix,
      won: won ?? this.won,
      lost: lost ?? this.lost,
      currentWordIndex: currentWordIndex ?? this.currentWordIndex,
      correctlyPlacedLetters:
          correctlyPlacedLetters ?? this.correctlyPlacedLetters,
      wronglyPlacedLetters: wronglyPlacedLetters ?? this.wronglyPlacedLetters,
      notInWordLetters: notInWordLetters ?? this.notInWordLetters,
      shaking: shaking ?? this.shaking,
    );
  }
}
