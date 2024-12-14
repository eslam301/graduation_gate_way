import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/button_with_icon.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../controller/project_page_view_details_controller.dart';

class ProjectViewDetailsPageView extends StatelessWidget {
  const ProjectViewDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectPageViewDetailsControllerImp());
    final theme = Theme.of(context);

    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: generalAppBar(
        title: 'Project Details',
        centerTitle: true,
        height: 80,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 120,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
            //border: Border.all(color: AppColors.grey, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(controller.project.imageLink),
              const SizedBox(height: 10),
              _buildTextRow('Project Title:', controller.project.title, theme),
              const SizedBox(height: 10),
              _buildDifficultyChip(controller.project.difficultyLevel, theme),
              const SizedBox(height: 10),
              _buildTextRow(
                  'Description:', controller.project.description, theme),
              const SizedBox(height: 10),
              _buildChipList(
                'Skills Required:',
                controller.project.skillsRequiredList,
                theme,
              ),
              const SizedBox(height: 10),
              _buildChipList(
                'Category:',
                controller.project.categoryList,
                theme,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.center,
                child: ButtonWithIcon(
                  color: AppColors.mainColorShaded,
                  //onPressed: () => {}, // Define your action
                  text: 'Register Project',
                  icon: Icons.arrow_forward_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? imageUrl) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.grey, width: 1.w),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) => SizedBox(
            height: 200.h,
            width: double.infinity,
            child: const Center(child: CircularProgressIndicator())),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildTextRow(String label, String? value, ThemeData theme) {
    return Text.rich(
      TextSpan(
        text: '$label ',
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
        children: [
          TextSpan(
            text: value ?? 'N/A',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifficultyChip(String? difficultyLevel, ThemeData theme) {
    return Row(
      children: [
        Text(
          'Difficulty Level: ',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        Chip(
          backgroundColor: AppColors.mainColor,
          label: Text(
            difficultyLevel ?? 'Unknown',
            style: TextStyle(color: AppColors.white, fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildChipList(String label, List<String>? items, ThemeData theme) {
    if (items == null || items.isEmpty) {
      return Text('$label N/A', style: theme.textTheme.bodyLarge);
    }
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        Text(
          '$label ',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        ...items.map(
          (item) => Chip(
            backgroundColor: AppColors.mainColor,
            label: Text(
              item,
              style: TextStyle(color: AppColors.white, fontSize: 14.sp),
            ),
          ),
        ),
      ],
    );
  }
}
