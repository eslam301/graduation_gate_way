import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../controller/project_recommendation_controller.dart';
import '../widget/project_recommendation_page_view_body.dart';

class ProjectRecommendationPageView extends StatelessWidget {
  const ProjectRecommendationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectRecommendationControllerImp controller =
        Get.put(ProjectRecommendationControllerImp());
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        userName: controller.user.firstname,
        subTitle: 'Project Recommendation',
      ),
      body: ProjectRecommendationPageViewBody(
        controller: controller,
      ),
      //bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
