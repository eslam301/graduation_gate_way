import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final IconAlignment iconAlignment;
  final Color? color;

  const ButtonWithIcon({
    super.key,
    this.text = 'Button',
    this.icon = Icons.add,
    this.onPressed,
    this.iconAlignment = IconAlignment.end,
    this.color = AppColors.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
        minimumSize: WidgetStateProperty.all(const Size(230, 50)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      iconAlignment: iconAlignment,
      icon: Icon(icon),
      label: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}