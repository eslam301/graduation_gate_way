import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;

  const BorderContainer(
      {super.key, required this.child, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 1.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10.0),
      child: child,
    );
  }
}
