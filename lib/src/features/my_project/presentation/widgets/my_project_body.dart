import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/components/border_container.dart';
import 'package:graduation_gate_way/src/core/widgets/components/surface_container.dart';
import 'package:graduation_gate_way/src/features/my_project/presentation/widgets/student_card.dart';

import '../../../../core/api/models/my_project_model.dart';

class MyProjectBody extends StatelessWidget {
  final MyProjectModel myProject;

  const MyProjectBody({super.key, required this.myProject});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SurfaceContainer(
      margin: 20,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    const TextSpan(
                      text: 'Title: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: myProject.projectName,
                      style: TextStyle(
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    const TextSpan(
                      text: 'Doctor: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: myProject.doctorName,
                      style: TextStyle(
                        fontSize: 18,
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            BorderContainer(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final bool isStudentPresent = myProject.students != null &&
                      index < myProject.students!.length;
                  final String idString = isStudentPresent
                      ? myProject.students![index].id.toString()
                      : '';
                  final String name = isStudentPresent
                      ? (myProject.students![index].name ?? 'Unknown')
                      : '';
                  return StudentCard(name: name, idString: idString);
                },
              ),
            ),
            const SizedBox(height: 15),
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'Description: ${myProject.description!}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
