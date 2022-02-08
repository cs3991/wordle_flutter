import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../authorized_words.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState.initial());

  void addLetter(String letter) {
    var letterIndex = state.lettersMatrix[state.currentWordIndex].indexOf(null);
    if (letterIndex == -1) {
      return;
    }
    var newLetterMatrix = List<List<String?>>.from(state.lettersMatrix);
    newLetterMatrix[state.currentWordIndex][letterIndex] = letter;
    emit(state.copyWith(lettersMatrix: newLetterMatrix));
    // print(state.lettersMatrix);
  }

  void deleteLetter() {
    var newLetterMatrix = List<List<String?>>.from(state.lettersMatrix);
    var index = newLetterMatrix[state.currentWordIndex]
        .lastIndexWhere((element) => element != null);
    if (index == -1) {
      return;
    }
    newLetterMatrix[state.currentWordIndex][index] = null;
    emit(state.copyWith(lettersMatrix: newLetterMatrix));
  }

  void submitWord() {
    if (state.lettersMatrix[state.currentWordIndex].contains(null)) {
      print('Le mot doit avoir 6 lettres');
      return;
    }
    if (!wordslist.contains(
        state.lettersMatrix[state.currentWordIndex].join().toLowerCase())) {
      print('Le mot n\'est pas dans la liste');
      return;
    }
    emit(state.copyWith(currentWordIndex: state.currentWordIndex + 1));
  }
}
