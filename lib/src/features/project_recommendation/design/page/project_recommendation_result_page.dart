import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../controller/project_recommendation_result_controller.dart';
import '../widget/recommended_result_container.dart';

class ProjectRecommendationResultPage extends StatelessWidget {
  const ProjectRecommendationResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectRecommendationResultControllerImp controller =
        Get.put(ProjectRecommendationResultControllerImp());
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        userName: controller.user.firstname,
        subTitle: 'Project Recommendation Result',

      ),
      body: GridView.builder(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 120,
          ),
          shrinkWrap: false,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 300,
          ),
          itemCount: controller.projectsRecommendationsResult.length,
          itemBuilder: (context, index) => RecommendedResultContainer(
                project: controller.projectsRecommendationsResult[index],
          )),
    );
  }
}
