import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/home/design/page/home_page_view.dart';
import 'package:graduation_gate_way/src/features/home/design/widget/category_card.dart';

import '../../../../core/const/image_pathes.dart';
import '../../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/loading_page.dart';
import '../../controller/home_layout_controller.dart';
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
                physics: const BouncingScrollPhysics(),
                itemCount: pagesList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: pagesList[index],
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
    ];
