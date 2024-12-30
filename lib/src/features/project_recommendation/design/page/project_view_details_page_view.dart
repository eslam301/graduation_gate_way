import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';

import '../../../../core/functions/functions.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/components/button_with_icon.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/widgets/general_app_bar.dart';
import '../../../chat_bot/design/widget/auto_style_text.dart';
import '../controller/project_page_view_details_controller.dart';

class ProjectViewDetailsPageView extends StatelessWidget {
  const ProjectViewDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectPageViewDetailsControllerImp controller =
        Get.put(ProjectPageViewDetailsControllerImp());
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
        child: SurfaceContainer(
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
              // _buildChipList(
              //   'Skills Required:',
              //   controller.project.skillsRequiredList,
              //   theme,
              // ),
              const SizedBox(height: 10),
              // _buildChipList(
              //   'Category:',
              //   controller.project.categoryList,
              //   theme,
              // ),
              const SizedBox(height: 10),
              // _buildChipList(
              //   'keywords:',
              //   controller.project.keywordsList,
              //   theme,
              // ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ButtonWithIcon(
                  color: theme.colorScheme.primary,
                  onPressed: () => controller.registerProject(),
                  // Define your action
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
      child: !isNetworkImage(imageUrl!)
          ? Image.file(
              File(imageUrl),
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            )
          : CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              height: 220,
              placeholder: (context, url) => const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(child: Icon(Icons.error))),
            ),
    );
  }

  Widget _buildTextRow(String label, String? value, ThemeData theme) {
    return AutoStyleText(
      '$label $value',
      style: const TextStyle(fontWeight: FontWeight.w400),
    );
  }

  Widget _buildDifficultyChip(String? difficultyLevel, ThemeData theme) {
    return Row(
      children: [
        Text(
          'Difficulty Level: ',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            difficultyLevel ?? 'Unknown',
            style:
                TextStyle(color: theme.colorScheme.onPrimary, fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

// Widget _buildChipList(String label, List<String>? items, ThemeData theme) {
//   if (items == null || items.isEmpty) {
//     return Text('$label N/A');
//   }
//   return Wrap(
//     spacing: 8,
//     runSpacing: 8,
//     crossAxisAlignment: WrapCrossAlignment.center,
//     children: [
//       Text(
//         '$label ',
//       ),
//       ...items.map(
//         (item) => Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//           decoration: BoxDecoration(
//             color: theme.colorScheme.primary,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Text(
//             item,
//             style:
//                 TextStyle(color: theme.colorScheme.onPrimary, fontSize: 16),
//           ),
//         ),
//       ),
//     ],
//   );
// }
}
