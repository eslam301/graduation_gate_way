import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/const/image_pathes.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/small_round_button.dart';
import '../../controller/splash_controller.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final controller = Get.put(SplashControllerImp());
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome',
                  style: theme.displayLarge?.copyWith(color: Colors.white)),
              Text('Graduation Getaway',
                  style: theme.headlineLarge?.copyWith(color: Colors.white)),
              Text('Your guide to graduate.',
                  style: theme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.white)),
              SvgPicture.asset(
                AppImagePathSvg.splash,
                width: 300.w,
                height: 300.h,
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: 224.w,
                  height: 48.h,
                  child: SmallRoundButton(
                    text: 'Sign up',
                    color: Colors.white,
                    textColor: AppColors.onSurface,
                    onPressed: () {
                      controller.navigateToSignUp();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  width: 224.w,
                  height: 48.h,
                  child: SmallRoundButton(
                    onPressed: () {
                      controller.navigateToLogin();
                    },
                    text: 'Log in',
                    color: Colors.transparent,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
