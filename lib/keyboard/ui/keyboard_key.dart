import 'package:flutter/material.dart';

abstract class KeyboardKey extends StatelessWidget {
  const KeyboardKey({Key? key, this.flex = 1, required this.onPress})
      : super(key: key);

  final int flex;
  final void Function(BuildContext context) onPress;

  Widget builder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => onPress(context),
          child: Ink(
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
      ),
    );
  }
}
