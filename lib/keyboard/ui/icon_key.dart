import 'package:flutter/material.dart';
import 'package:wordle/keyboard/ui/keyboard_key.dart';

class IconKey extends KeyboardKey {
  const IconKey({
    Key? key,
    required this.icon,
    required void Function(BuildContext) onPress,
  }) : super(key: key, flex: 2, onPress: onPress);

  final IconData icon;

  @override
  Widget builder(BuildContext context) {
    return Icon(icon);
  }
}
