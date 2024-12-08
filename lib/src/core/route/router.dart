import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/routes_name.dart';
import 'package:graduation_gate_way/src/features/auth/design/page/forget_password_page_view.dart';
import 'package:graduation_gate_way/src/features/auth/design/page/sign_up_page_view.dart';
import 'package:graduation_gate_way/src/features/home/design/layout/home_layout.dart';

import '../../features/auth/design/page/login_page_view.dart';
import '../../features/auth/design/page/otp_page_view.dart';
import '../../features/auth/design/page/reset_password_page_view.dart';
import '../../features/on_boarding/design/layout/on_boarding_layout.dart';
import '../../features/splash/design/page/on_splash.dart';
import '../../features/splash/design/page/splash_page_view.dart';

class AppRouter {
  static List<GetPage<dynamic>> pagesRoute = [
    // Splash
    getPage(name: Routes.onSplash, page: () => const OnSplashPageView()),
    getPage(name: Routes.splash, page: () => const SplashPageView()),
    // Auth
    getPage(name: Routes.login, page: () => const LoginPageView()),
    getPage(name: Routes.signUp, page: () => const SignUpPageView()),
    getPage(
        name: Routes.forgetPassword,
        page: () => const ForgetPasswordPageView()),
    getPage(name: Routes.otpPage, page: () => const OTPPageView()),
    getPage(
        name: Routes.resetPassword, page: () => const ResetPasswordPageView()),
    // Layouts
    getPage(name: Routes.onBoarding, page: () => const OnBoardingLayout()),
    getPage(name: Routes.home, page: () => const HomeLayOut()),
  ];
}

GetPage<dynamic> getPage(
        {required String name, required Widget Function() page}) =>
    GetPage(
      name: name,
      page: page,
      curve: Curves.easeInOut,
      binding: BindingsBuilder(() {
        debugPrint('Binding $name');
      }),
      //transition: Transition.fadeIn,
      transition: Platform.isIOS ? Transition.cupertino : Transition.fadeIn,
      fullscreenDialog: true,
      transitionDuration: const Duration(milliseconds: 300),
    );

Future<void> getBack() async => Get.back(
      canPop: true,
      closeOverlays: true,
    );

extension RouteParse on String {
  void toPage({dynamic arguments}) => Get.toNamed(
        this,
        arguments: arguments,
        preventDuplicates: true,
      );
  void offPage({dynamic arguments}) => Get.offNamed(
        this,
        arguments: arguments,
      );
  void offAllPage({dynamic arguments}) => Get.offAllNamed(
        this,
        arguments: arguments,
      );
}
