import 'package:flutter/material.dart';
import 'package:wordle/keyboard/ui/keyboard_key.dart';

class IconKey extends StatelessWidget {
  const IconKey({Key? key, required this.icon, required this.onPress})
      : super(key: key);

  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
