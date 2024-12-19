import 'package:flutter/material.dart';

class SurfaceContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double borderRadius;
  final double margin;
  final double padding;

  const SurfaceContainer(
      {super.key,
      required this.child,
      this.color,
      this.borderRadius = 20,
      this.margin = 0,
      this.padding = 15});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }
}
