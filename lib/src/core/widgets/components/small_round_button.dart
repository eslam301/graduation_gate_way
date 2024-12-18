import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class SmallRoundButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double radius;
  final double fontSize;
  final void Function()? onPressed;

  const SmallRoundButton({
    super.key,
    required this.text,
    this.color = AppColors.mainColor,
    required this.textColor,
    this.onPressed,
    this.radius = 50,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
