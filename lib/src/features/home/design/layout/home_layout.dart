import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/features/home/design/widget/category_card.dart';

import '../../../../core/const/image_pathes.dart';
import '../../../../core/route/routes_name.dart';
import '../../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/loading_page.dart';
import '../../controller/home_layout_controller.dart';
import '../page/home_page_student_view.dart';
import '../widget/home_app_bar.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeLayoutControllerImp controller =
        Get.put(HomeLayoutControllerImp());
    final pagesList = pages(controller);

    return Obx(() {
      return controller.isLoading.value
          ? const LoadingPage()
          : Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: homeAppBar(),
              endDrawer: const CustomDrawer(),
              body: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pagesList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: pagesList[controller.user.role == 'student' ? 0 : 1],
                ),
              ),
              bottomNavigationBar: const CustomBottomNavigationBar(),
            );
    });
  }
}

List<Widget> pages(HomeLayoutControllerImp controller) => [
      CategoryPageView(
        categoryModelList: [
          CategoryCardModel(
            imagePath: AppImagePathSvg.myProject,
            title: 'My Project',
            onTap: () {
              controller.myProject();
            },
          ),
          CategoryCardModel(
            imagePath: AppImagePathSvg.registerProject,
            title: 'Register project',
            onTap: () {
              controller.registerProject();
            },
          ),
          CategoryCardModel(
            imagePath: AppImagePathSvg.projectRecommendation,
            title: 'Project Recommendation',
            onTap: () {
              controller.projectRecommendation();
            },
          ),
        ],
      ),
      CategoryPageView(categoryModelList: [
        CategoryCardModel(
          imagePath: AppImagePathSvg.myProject,
          title: 'Projects',
          onTap: Routes.doctorProjects.toPage,
        ),
        CategoryCardModel(
          imagePath: AppImagePathSvg.reports,
          title: 'Reports',
          onTap: Routes.doctorReports.toPage,
        ),
        CategoryCardModel(
          imagePath: AppImagePathSvg.grades,
          title: 'Grades',
          onTap: Routes.grades.toPage,
        )
        // CategoryCardModel(
        //   imagePath: AppImagePathSvg.followUp,
        //   title: 'Follow-up',
        //   onTap: Routes.doctorFollowUps.toPage,
        // )
      ]),
    ];
