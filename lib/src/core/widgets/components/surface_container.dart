import 'package:flutter/material.dart';

class SurfaceContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double borderRadius;
  final double margin;
  final double padding;
  final double? height;
  final double? width;

  const SurfaceContainer(
      {super.key,
      required this.child,
      this.color,
      this.borderRadius = 20,
      this.margin = 0,
      this.padding = 15,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
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
