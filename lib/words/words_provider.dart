import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

class WordsProvider {
  List<String>? _authorizedSolutionList;
  Set<String>? _authorizedGuessList;

  Stream<String> _readFile(String path) {
    return rootBundle
        .loadString(path)
        .asStream()
        .transform(const LineSplitter());
  }

  Future<List<String>> get authorizedSolutionList async {
    Timeline.startSync('solution reading');
    _authorizedSolutionList ??=
        await _readFile('lib/words/assets/authorized_solutions.txt').toList();
    Timeline.finishSync();
    return _authorizedSolutionList!;
  }

  Future<Set<String>> get authorizedGuessList async {
    Timeline.startSync('guesses reading');
    _authorizedGuessList ??=
        await _readFile('lib/words/assets/authorized_guesses.txt').toSet();
    Timeline.finishSync();
    return _authorizedGuessList!;
  }
}
