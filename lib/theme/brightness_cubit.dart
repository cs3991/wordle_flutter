import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class BrightnessCubit extends HydratedCubit<Brightness> {
  BrightnessCubit() : super(Brightness.light);

  void switchBrightness() {
    if (state == Brightness.light) {
      emit(Brightness.dark);
    } else {
      emit(Brightness.light);
    }
  }

  @override
  Brightness? fromJson(Map<String, dynamic> json) {
    return json['brightness'] == Brightness.light.toString()
        ? Brightness.light
        : Brightness.dark;
  }

  @override
  Map<String, dynamic>? toJson(Brightness state) {
    return <String, dynamic>{'brightness': state.toString()};
  }
}
