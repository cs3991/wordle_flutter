import 'package:flutter/material.dart';

abstract class KeyboardKey extends StatelessWidget {
  final int flex;

  const KeyboardKey({Key? key, this.flex = 1}) : super(key: key);

  Widget builder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: builder(context),
          ),
        ),
      ),
    );
  }
}
