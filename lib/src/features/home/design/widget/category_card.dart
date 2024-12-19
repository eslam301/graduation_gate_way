import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_color.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final void Function()? onTap;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  fontSize: title.length > 20 ? 14 : 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'view',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCardModel {
  final String imagePath;
  final String title;
  final void Function()? onTap;

  CategoryCardModel({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });
}
