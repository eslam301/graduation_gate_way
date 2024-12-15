import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/api/models/projects_recommendations.dart';
import 'package:graduation_gate_way/src/core/const/image_pathes.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';

import '../../../../core/route/routes_name.dart';
import '../../../../core/theme/app_color.dart';

class RecommendedResultContainer extends StatelessWidget {
  final ProjectRecommendationModel project;

  const RecommendedResultContainer({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 300,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: project.imageLink ?? AppImagePathNetwork.errorImageLink,
            fit: BoxFit.cover,
            placeholder: (context, url) => const SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(child: CircularProgressIndicator())),
            errorWidget: (context, url, error) => const SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(child: Icon(Icons.error))),
          ),
          const Spacer(),
          const SizedBox(
            width: 10,
          ),
          Text(
            project.title!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Difficulty: ${project.difficultyLevel!}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 120,
            height: 40,
            child: MainButton(
              onPressed: () {
                Routes.projectViewDetailsPageView.toPage(
                  arguments: project,
                );
              },
              text: 'View',
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
