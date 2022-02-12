import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  void setMax(int max) {
    emit(state.copyWith(maxWordLength: max));
  }

  void setMin(int min) {
    emit(state.copyWith(minWordLength: min));
  }

  void setPossibleNumber(int number) {
    emit(state.copyWith(possibleWordsNumber: number));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.initial().copyWith(
      maxWordLength: json['maxWordLength'] as int?,
      minWordLength: json['minWordLength'] as int?,
      possibleWordsNumber: json['possibleWordsNumber'] as int?,
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return <String, dynamic>{
      'maxWordLength': state.maxWordLength,
      'minWordLength': state.minWordLength,
      'possibleWordsNumber': state.possibleWordsNumber,
    };
  }
}
