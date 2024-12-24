import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/core/widgets/general_app_bar.dart';

import '../../../../core/widgets/components/border_container.dart';
import '../../../my_project/presentation/widgets/student_card.dart';

class MyProjectDoctorDetailsPageView extends StatelessWidget {
  const MyProjectDoctorDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(
        title: 'My Project',
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 120),
        child: Column(
          children: [
            const Text('Project Name'),
            10.verticalSpace,
            BorderContainer(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const StudentCard(name: 'name', idString: '1');
                  }),
            ),
            10.verticalSpace,
            BorderContainer(
              color: Theme.of(context).colorScheme.surface,
              width: double.infinity,
              height: 200,
              child: const Text(
                'Project Description',
              ),
            ),
            10.verticalSpace,
            MainButton(onPressed: () {}, text: 'Tasks')
          ],
        ),
      ),
    );
  }
}
