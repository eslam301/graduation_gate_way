import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_gate_way/src/features/on_boarding/model/onboarding_entity.dart';

import '../../../../core/theme/app_color.dart';

class OnBoardingWidget extends StatelessWidget {
  final OnBoarding onBoarding;

  const OnBoardingWidget({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(onBoarding.image),
          const SizedBox(
            height: 60,
          ),
          Text(
            onBoarding.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          Text(
            onBoarding.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          )
        ]);
  }
}
