import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class BrightnessCubit extends Cubit<Brightness> {
  BrightnessCubit() : super(Brightness.light);

  void switchBrightness() {
    if (state == Brightness.light) {
      emit(Brightness.dark);
    } else {
      emit(Brightness.light);
    }
  }
}
