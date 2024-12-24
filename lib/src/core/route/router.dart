import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/routes_name.dart';
import 'package:graduation_gate_way/src/features/auth/design/page/forget_password_page_view.dart';
import 'package:graduation_gate_way/src/features/auth/design/page/sign_up_page_view.dart';
import 'package:graduation_gate_way/src/features/chat_bot/design/page/chat_page_view.dart';
import 'package:graduation_gate_way/src/features/follow_up/presentation/pages/follow_up_doctor_page_view.dart';
import 'package:graduation_gate_way/src/features/grades/presentation/pages/grades_page_view.dart';
import 'package:graduation_gate_way/src/features/home/design/layout/home_layout.dart';
import 'package:graduation_gate_way/src/features/my_project/presentation/pages/my_project_page_view.dart';
import 'package:graduation_gate_way/src/features/my_project_doctor/presentation/pages/my_project_doctor_page_view.dart';
import 'package:graduation_gate_way/src/features/profile/design/page/profile_page_view.dart';
import 'package:graduation_gate_way/src/features/reports/presentation/pages/reports_page_view.dart';

import '../../features/auth/design/page/login_page_view.dart';
import '../../features/auth/design/page/otp_page_view.dart';
import '../../features/auth/design/page/reset_password_page_view.dart';
import '../../features/auth/design/page/sign_up_page_as_doctor.dart';
import '../../features/auth/design/page/sign_up_page_as_student.dart';
import '../../features/on_boarding/design/layout/on_boarding_layout.dart';
import '../../features/project_recommendation/design/page/project_recommendation_page_view.dart';
import '../../features/project_recommendation/design/page/project_recommendation_result_page.dart';
import '../../features/project_recommendation/design/page/project_view_details_page_view.dart';
import '../../features/project_registeration/design/pages/project_registration_page_view.dart';
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
        name: Routes.signUpAsDoctor, page: () => const SignUpPageAsDoctor()),
    getPage(
        name: Routes.signUpAsStudent, page: () => const SignUpPageAsStudent()),
    getPage(
        name: Routes.forgetPassword,
        page: () => const ForgetPasswordPageView()),
    getPage(name: Routes.otpPage, page: () => const OTPPageView()),
    getPage(
        name: Routes.resetPassword, page: () => const ResetPasswordPageView()),
    // Layouts
    getPage(name: Routes.onBoarding, page: () => const OnBoardingLayout()),
    getPage(name: Routes.home, page: () => const HomeLayOut()),

    // Project Recommendation
    getPage(
      name: Routes.projectRecommendationTest,
      page: () => const ProjectRecommendationPageView(),
    ),
    getPage(
        name: Routes.projectRecommendationResultPage,
        page: () => const ProjectRecommendationResultPage()),
    getPage(
        name: Routes.projectViewDetailsPageView,
        page: () => const ProjectViewDetailsPageView()),

    // project registration
    getPage(
        name: Routes.projectRegistration,
        page: () => const ProjectRegistrationPageView()),
    // Profile
    getPage(name: Routes.profile, page: () => const ProfilePageView()),
    // Chat
    getPage(name: Routes.chat, page: () => const ChatPageView()),
    // my project
    getPage(name: Routes.myProject, page: () => const MyProjectPageView()),
    // doctor pages
    //projects
    getPage(
        name: Routes.doctorProjects,
        page: () => const MyProjectDoctorPageView()),
    // reports
    getPage(name: Routes.doctorReports, page: () => const ReportsPageView()),
    //grades
    getPage(name: Routes.grades, page: () => const GradesPageView()),
    //follow_up
    getPage(
        name: Routes.doctorFollowUps,
        page: () => const FollowUpDoctorPageView()),
  ];
}

GetPage<dynamic> getPage(
        {required String name,
        required Widget Function() page,
        List<GetPage<dynamic>> children = const []}) =>
    GetPage(
      name: name,
      page: page,
      curve: Curves.easeInOut,
      children: children,
      binding: BindingsBuilder(() {
        debugPrint('Binding $name');
      }),
      //transition: Transition.fadeIn,
      transition: Platform.isIOS ? Transition.cupertino : Transition.fadeIn,
      fullscreenDialog: false,
      transitionDuration: const Duration(milliseconds: 300),
    );

Future<void> getBack() async => Get.back(
      canPop: true,
      closeOverlays: true,
    );

Future<void> getToPage(Widget page) async => Get.to(
      () => page,
    );

extension RouteParse on String {
  void toPage({dynamic arguments}) => Get.toNamed(
        this,
        arguments: arguments,
        preventDuplicates: true,
      );

  void getBackToPage({dynamic arguments}) => Get.until(
        (route) => Get.currentRoute == this,
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
