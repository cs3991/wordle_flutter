import 'package:flutter/material.dart';
import 'package:wordle/keyboard/ui/keyboard.dart';

import 'grid/ui/grid.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text('Wordle', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        toolbarHeight: 64,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Grid(),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}
