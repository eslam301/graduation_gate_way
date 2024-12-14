import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/button_with_icon.dart';
import '../../controller/on_boarding_controller.dart';
import '../widget/on_boarding_widget.dart';

class OnBoardingLayout extends StatelessWidget {
  const OnBoardingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      init: OnBoardingControllerImp(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.onBoardingList.length,
                  itemBuilder: (context, index) => OnBoardingWidget(
                    onBoarding: controller.onBoardingList[index],
                  ),
                  onPageChanged: (index) => controller.swipe(index),
                ),
                Positioned(
                  bottom: 320.h,
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.mainColor,
                      dotHeight: 6,
                      dotWidth: 8,
                      dotColor: AppColors.grey,
                      spacing: 8,
                      expansionFactor: 3,
                    ),
                    onDotClicked: (index) =>
                        controller.pageController.animateToPage(
                      index,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    ),
                    count: controller.onBoardingList.length,
                  ),
                ),
                Positioned(
                  bottom: controller.isLastPage() ? 110.h : 140.h,
                  right: controller.isLastPage() ? 0.w : 20.w,
                  left: controller.isLastPage() ? 0.w : null,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    child: controller.isLastPage()
                        ? ButtonWithIcon(
                            text: "Let's Start",
                            icon: Icons.arrow_forward_ios,
                            onPressed: () {
                              controller.letsStart();
                            },
                          )
                        : InkWell(
                            onTap: () {
                              // Navigate to the end directly or handle "Skip" functionality
                              controller.skip();
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
