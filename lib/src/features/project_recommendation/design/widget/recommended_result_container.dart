import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/api/models/projects_recommendations.dart';
import 'package:graduation_gate_way/src/core/const/image_pathes.dart';
import 'package:graduation_gate_way/src/core/extensions/on_widgets.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/widgets/main_button.dart';
import '../../../../core/route/routes_name.dart';
import '../../../../core/theme/app_color.dart';

class RecommendedResultContainer extends StatelessWidget {
  final ProjectsRecommendations project;
  const RecommendedResultContainer({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.grey, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: project.imageLink ?? AppImagePathNetwork.errorImageLink,
            fit: BoxFit.cover,
            placeholder: (context, url) => SizedBox(
                height: 80.h,
                width: double.infinity,
                child: const Center(child: CircularProgressIndicator())),
            errorWidget: (context, url, error) =>
                SizedBox(
                    height: 80.h,
                    width: double.infinity,
                    child: const Center(child: Icon(Icons.error))),
          ),
          const Spacer(),
          10.h.verticalSpace,
          Text(
            project.title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.black,
            ),
          ),
          10.h.verticalSpace,
          Text(
            "Difficulty: ${project.difficultyLevel!}",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.grey,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 80.h,
            height: 40.h,
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
          10.h.verticalSpace,
        ],
      ),
    );
  }
}
