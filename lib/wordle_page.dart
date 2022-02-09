import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/grid/ui/grid.dart';
import 'package:wordle/keyboard/ui/keyboard.dart';
import 'package:wordle/theme/brightness_cubit.dart';

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
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: BlocBuilder<BrightnessCubit, Brightness>(
                builder: (context, brightness) {
                  return Icon(
                    brightness == Brightness.dark
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    color: Theme.of(context).colorScheme.onSurface,
                  );
                },
              ),
            ),
            onPressed: () {
              BlocProvider.of<BrightnessCubit>(context).switchBrightness();
            },
          ),
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Grid(),
          Keyboard(),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
