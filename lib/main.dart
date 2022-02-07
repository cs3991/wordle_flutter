import 'package:flutter/material.dart';

import 'wordle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0x241541)),
      ),
      home: const WordlePage(),
    );
  }
}

