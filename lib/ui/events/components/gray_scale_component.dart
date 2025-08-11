import 'package:flutter/material.dart';

class Grayscale extends StatelessWidget {
  const Grayscale({required this.child, super.key, this.isActive = false});

  final Widget child;
  final bool isActive;

  static const _matrix = <double>[
    0.2126, 0.7152, 0.0722, 0, 0, // Red
    0.2126, 0.7152, 0.0722, 0, 0, // Green
    0.2126, 0.7152, 0.0722, 0, 0, // Blue
    0, 0, 0, 1, 0, // Alpha
  ];

  @override
  Widget build(final BuildContext context) =>
      isActive
          ? ColorFiltered(
            colorFilter: const ColorFilter.matrix(_matrix),
            child: child,
          )
          : child;
}
