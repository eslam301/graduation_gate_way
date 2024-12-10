import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/features/home/design/page/home_page_view.dart';
import 'package:graduation_gate_way/src/features/home/design/widget/category_card.dart';

import '../../../../core/const/image_pathes.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../controller/home_layout_controller.dart';
import '../widget/custom_bottom_navigation_bar.dart';
import '../widget/home_app_bar.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeLayoutControllerImp controller =
        Get.put(HomeLayoutControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: homeAppBar(controller: controller),
      endDrawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 30,
        ),
        child: HomePageView(
          categoryModelList: [
            CategoryCardModel(
              imagePath: AppImagePathSvg.myProject,
              title: 'My Project',
            ),
            CategoryCardModel(
              imagePath: AppImagePathSvg.registerProject,
              title: 'Register project',
            ),
            CategoryCardModel(
              imagePath: AppImagePathSvg.projectRecommendation,
              title: 'Project Recommendation',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
