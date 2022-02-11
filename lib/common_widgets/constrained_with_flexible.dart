import 'package:flutter/material.dart';

class ConstrainedWidthFlexible extends StatelessWidget {
  const ConstrainedWidthFlexible({
    Key? key,
    required this.minWidth,
    required this.maxWidth,
    required this.flex,
    required this.flexSum,
    required this.outerConstraints,
    required this.child,
  }) : super(key: key);

  final double minWidth;
  final double maxWidth;
  final int flex;
  final int flexSum;
  final Widget child;
  final BoxConstraints outerConstraints;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
      ),
      child: SizedBox(
        width: _getWidth(outerConstraints.maxWidth),
        child: child,
      ),
    );
  }

  double _getWidth(double outerContainerWidth) {
    return outerContainerWidth * flex / flexSum;
  }
}
