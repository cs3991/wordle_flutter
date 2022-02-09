import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:diacritic/diacritic.dart';
import 'package:meta/meta.dart';

import 'package:wordle/game_logic/authorized_words.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.initial());

  void initGame() {
    final possibleWordsList =
        authorizedWordList.where((element) => element.length == 6);
    final word = removeDiacritics(
      possibleWordsList.elementAt(Random().nextInt(possibleWordsList.length)),
    ).toUpperCase();
    print(word);
    emit(state.copyWith(word: word));
  }

  void addLetter(String letter) {
    if (state.word == null) {
      initGame();
    }
    final letterIndex =
        state.lettersMatrix[state.currentWordIndex].indexOf(null);
    if (letterIndex == -1) {
      return;
    }
    final newLetterMatrix = List<List<String?>>.from(state.lettersMatrix);
    newLetterMatrix[state.currentWordIndex][letterIndex] = letter;
    emit(state.copyWith(lettersMatrix: newLetterMatrix));
  }

  void deleteLetter() {
    final newLetterMatrix = List<List<String?>>.from(state.lettersMatrix);
    final index = newLetterMatrix[state.currentWordIndex]
        .lastIndexWhere((element) => element != null);
    if (index == -1) {
      return;
    }
    newLetterMatrix[state.currentWordIndex][index] = null;
    emit(state.copyWith(lettersMatrix: newLetterMatrix));
  }

  void submitWord() {
    final submittedWord = state.lettersMatrix[state.currentWordIndex];
    if (submittedWord.contains(null)) {
      print('Le mot doit avoir 6 lettres');
      return;
    }
    if (!authorizedWordList
        .contains(state.lettersMatrix[state.currentWordIndex].join())) {
      print("Le mot n'est pas dans la liste");
      return;
    }

    // check status of each letter
    final visitedIndex = <int>[];
    for (var i = 0; i < 6; i++) {
      final letter = submittedWord[i];
      if (state.word![i] == letter!) {
        state.statusMatrix[state.currentWordIndex][i] =
            LetterStatus.correctSpot;
        visitedIndex.add(i);
      }
      print(visitedIndex);
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
        } else {
          state.statusMatrix[state.currentWordIndex][i] =
              LetterStatus.notInWord;
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

    emit(state.copyWith(currentWordIndex: state.currentWordIndex + 1));
  }
}
