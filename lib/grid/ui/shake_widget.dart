import 'dart:math';

import 'package:flutter/material.dart';

class SineCurve extends Curve {
  const SineCurve({this.count = 3});

  final double count;

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t);
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  @override
  State<ShakeWidget> createState() => ShakeWidgetState();
}

class ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  void shake() {
    controller.forward();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.shakeDuration,
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: SineCurve(count: widget.shakeCount.toDouble()),
      ),
    );
    controller.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    controller
      ..dispose()
      ..removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(animation.value * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}
