import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/router.dart';
import '../../../../core/widgets/components/main_button.dart';
import '../../../../core/widgets/components/surface_container.dart';
import '../../../my_project/presentation/widgets/student_card.dart';
import '../../../project_registeration/data/models/project_model.dart';
import '../pages/my_project_doctor_details_page_view.dart';

class DoctorProjectContainer extends StatelessWidget {
  final ProjectModel project;

  const DoctorProjectContainer({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getToPage(MyProjectDoctorDetailsPageView(
          project: project,
        ));
      },
      child: SurfaceContainer(
        margin: 10,
        padding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section for project description
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  project.name ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(
                  Icons.more_horiz,
                  size: 24,
                )
              ],
            ),
            // Section for student list
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true, // Adjust to content height
              physics: const NeverScrollableScrollPhysics(),
              // Disable scrolling inside
              itemBuilder: (context, studentIndex) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: StudentCard(
                    name: 'Student Name',
                    idString: 'ID Number',
                  ),
                );
              },
            ),
            10.verticalSpace,
            SizedBox(
                width: 150,
                child: MainButton(
                    onPressed: () {
                      getToPage(MyProjectDoctorDetailsPageView(
                        project: project,
                      ));
                    },
                    text: 'View'))
          ],
        ),
      ),
    );
  }
}
