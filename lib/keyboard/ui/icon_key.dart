import 'package:flutter/material.dart';
import 'package:wordle/common_widgets/constrained_with_flexible.dart';
import 'package:wordle/keyboard/ui/keyboard_key.dart';

class IconKey extends StatelessWidget {
  const IconKey({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.constraint,
  }) : super(key: key);

  final BoxConstraints constraint;
  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ConstrainedWidthFlexible(
      minWidth: 2,
      maxWidth: 100,
      flex: 2,
      flexSum: 10,
      outerConstraints: constraint,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPress,
          child: KeyboardKey(flex: 2, child: Icon(icon)),
        ),
      ),
    );
  }
}
