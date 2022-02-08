import 'package:flutter/material.dart';
import 'package:wordle/theme/brightness_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'wordle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BrightnessCubit()),
      ],
      child: BlocBuilder<BrightnessCubit, Brightness>(
        builder: (context, brightness) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Wordle',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0x241541),
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0x241541),
                brightness: Brightness.dark,
              ),
            ),
            themeMode: brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const WordlePage(),
          );
        },
      ),
    );
  }
}
