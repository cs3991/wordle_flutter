import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordle/keyboard/ui/keyboard_key.dart';

class IconKey extends KeyboardKey {
  final IconData icon;

  IconKey({Key? key, required this.icon, required onPress})
      : super(key: key, flex: 2, onPress: onPress);

  @override
  Widget builder(BuildContext context) {
    return Icon(icon);
  }
}
