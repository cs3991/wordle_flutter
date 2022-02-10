import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:diacritic/diacritic.dart';
import 'package:meta/meta.dart';
import 'package:wordle/game_logic/authorized_guesses.dart';
import 'package:wordle/game_logic/authorized_solutions.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.initial()) {
    initGame();
  }

  void initGame() {
    const numberOfWords = 7000;
    final possibleWordsList = authorizedSolutionList
        .take(numberOfWords)
        .where((element) => element.length == 6);
    final word = removeDiacritics(
      possibleWordsList.elementAt(Random().nextInt(possibleWordsList.length)),
    ).toUpperCase();
    print(word);
    emit(GameState.initial().copyWith(word: word));
  }

  void addLetter(String letter) {
    if (state.lost || state.won) {
      return;
    }

    assert(
      state.word != null,
      'state should not be null, game should have been initialized',
    );
    final letterIndex =
        state.letterMatrix[state.currentWordIndex].indexOf(null);
    if (letterIndex == -1) {
      return;
    }
    final newLetterMatrix = List<List<String?>>.from(state.letterMatrix);
    newLetterMatrix[state.currentWordIndex][letterIndex] = letter;
    emit(state.copyWith(letterMatrix: newLetterMatrix));
  }

  void deleteLetter() {
    if (state.lost || state.won) {
      return;
    }

    final newLetterMatrix = List<List<String?>>.from(state.letterMatrix);
    final index = newLetterMatrix[state.currentWordIndex]
        .lastIndexWhere((element) => element != null);
    if (index == -1) {
      return;
    }
    newLetterMatrix[state.currentWordIndex][index] = null;
    emit(state.copyWith(letterMatrix: newLetterMatrix));
  }

  void submitWord() {
    if (state.lost || state.won) {
      return;
    }

    final submittedWord = state.letterMatrix[state.currentWordIndex];
    if (submittedWord.contains(null)) {
      print('Le mot doit avoir 6 lettres');
      return;
    }
    if (!authorizedGuessList
        .contains(state.letterMatrix[state.currentWordIndex].join())) {
      emit(
        state.copyWith(
          shaking: List<bool>.generate(
            6,
                (index) => index == state.currentWordIndex,
          ),
        ),
      );
      print("Le mot n'est pas dans la liste");
      emit(
        state.copyWith(shaking: List<bool>.filled(6, false)),
      );
      return;
    }

    // check status of each letter
    final visitedIndex = <int>{};
    final correctlyPlacedLetters = state.correctlyPlacedLetters.toSet();
    final wronglyPlacedLetters = state.wronglyPlacedLetters.toSet();
    final notInWordLetters = state.notInWordLetters.toSet();
    for (var i = 0; i < 6; i++) {
      final letter = submittedWord[i];
      if (state.word![i] == letter!) {
        state.statusMatrix[state.currentWordIndex][i] =
            LetterStatus.correctSpot;
        visitedIndex.add(i);
        correctlyPlacedLetters.add(letter);
      }
    }
    for (var i = 0; i < 6; i++) {
      if (!visitedIndex.contains(i)) {
        final letter = submittedWord[i];
        final wordSplit = state.word!.split('');
        for (final element in visitedIndex) {
          wordSplit.remove(submittedWord[element]);
        }

        if (wordSplit.contains(letter)) {
          state.statusMatrix[state.currentWordIndex][i] =
              LetterStatus.wrongSpot;
          visitedIndex.add(i);
          wronglyPlacedLetters.add(letter!);
        } else {
          state.statusMatrix[state.currentWordIndex][i] =
              LetterStatus.notInWord;
          notInWordLetters.add(letter!);
        }
      }
    }
    if (submittedWord.join() == state.word) {
      print('Gagné !');
      emit(state.copyWith(won: true));
      return;
    }

    if (state.currentWordIndex == 5) {
      print('Perdu :(');
      emit(state.copyWith(lost: true));
      return;
    }

    emit(
      state.copyWith(
        currentWordIndex: state.currentWordIndex + 1,
        correctlyPlacedLetters:
        state.correctlyPlacedLetters.union(correctlyPlacedLetters),
        wronglyPlacedLetters:
        state.wronglyPlacedLetters.union(wronglyPlacedLetters),
        notInWordLetters: state.notInWordLetters.union(notInWordLetters),
      ),
    );
  }
}
