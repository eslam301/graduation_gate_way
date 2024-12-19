import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

class AnswerWidget extends StatefulWidget {
  final String title;

  const AnswerWidget({super.key, required this.title});

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isSelected = !isSelected),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.mainColor : AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.grey, width: 1),
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
