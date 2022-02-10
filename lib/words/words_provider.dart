import 'dart:convert';

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
    _authorizedSolutionList ??=
        await _readFile('lib/words/assets/authorized_solutions.txt').toList();
    return _authorizedSolutionList!;
  }

  Future<Set<String>> get authorizedGuessList async {
    _authorizedGuessList ??=
        await _readFile('lib/words/assets/authorized_guesses.txt').toSet();
    return _authorizedGuessList!;
  }
}
