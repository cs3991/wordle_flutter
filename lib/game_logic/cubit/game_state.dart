part of 'game_cubit.dart';

enum LetterStatus { unknown, notInWord, wrongSpot, correctSpot }

@immutable
class GameState {
  const GameState({
    required this.word,
    required this.currentWordIndex,
    required this.lettersMatrix,
    required this.statusMatrix,
    required this.won,
    required this.lost,
  });

  GameState.initial()
      : word = null,
        lettersMatrix = List<List<String?>>.generate(
          6,
          (i) => List<String?>.filled(6, null),
        ),
        statusMatrix = List<List<LetterStatus>>.generate(
          6,
          (i) => List<LetterStatus>.filled(6, LetterStatus.unknown),
        ),
        won = false,
        lost = false,
        currentWordIndex = 0;

  final String? word;
  final List<List<String?>> lettersMatrix;
  final List<List<LetterStatus>> statusMatrix;
  final int currentWordIndex;
  final bool won;
  final bool lost;

  GameState copyWith({
    String? word,
    List<List<String?>>? lettersMatrix,
    List<List<LetterStatus>>? statusMatrix,
    bool? won,
    bool? lost,
    int? currentWordIndex,
  }) {
    return GameState(
      word: word ?? this.word,
      lettersMatrix: lettersMatrix ?? this.lettersMatrix,
      statusMatrix: statusMatrix ?? this.statusMatrix,
      won: won ?? this.won,
      lost: lost ?? this.lost,
      currentWordIndex: currentWordIndex ?? this.currentWordIndex,
    );
  }
}
