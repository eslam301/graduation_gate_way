import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';

import '../../../core/route/routes_name.dart';
import '../model/onboarding_entity.dart';

abstract class OnBoardingController extends GetxController{
  skip();
  letsStart();
  swipe(int index);
}

class OnBoardingControllerImp extends OnBoardingController{
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List <OnBoarding> onBoardingList = [

    OnBoarding(
      image: 'assets/svg/onboarding_1.svg',
      title: 'Keep project on track',
      description: 'Get your work done with ease, work better together with your team.',
    ),
    OnBoarding(
      image: 'assets/svg/onboarding_2.svg',
      title: 'Stay connected ',
      description: 'Stay connected with your team members while working from home',
    ),
    OnBoarding(
      image: 'assets/svg/onboarding_3.svg',
      title: 'Schedule wit doctors ',
      description: 'Stay connected with your team members while working from home',
    ),
  ];
 bool isLastPage() => currentPage == onBoardingList.length - 1;

  @override
  void onInit() {
    currentPage = 0;

    super.onInit();
  }
  @override
  skip() {
      pageController.animateToPage(
      onBoardingList.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
      update();
  }
  @override
  swipe(int index) {
    currentPage = index;
    update();
  }
  @override
  letsStart() {
    Routes.home.offAllPage();
  }
}