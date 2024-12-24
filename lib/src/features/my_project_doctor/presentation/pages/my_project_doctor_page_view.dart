import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/route/router.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';
import 'package:graduation_gate_way/src/features/my_project/presentation/widgets/student_card.dart';

import 'my_project_doctor_details_page_view.dart';

class MyProjectDoctorPageView extends StatelessWidget {
  const MyProjectDoctorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(
        title: 'My Project',
      ),
      body: ListView.builder(
        itemCount: 2,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              getToPage(const MyProjectDoctorDetailsPageView());
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
                        'Project Name',
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
                            getToPage(const MyProjectDoctorDetailsPageView());
                          },
                          text: 'View'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
