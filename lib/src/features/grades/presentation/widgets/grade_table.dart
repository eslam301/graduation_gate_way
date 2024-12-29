import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_gate_way/src/core/widgets/components/main_button.dart';
import 'package:graduation_gate_way/src/features/grades/presentation/manager/grades_controller.dart';

class GradeTable extends StatelessWidget {
  const GradeTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GradesController>();
    return Obx(() {
      return controller.grades.isEmpty
          ? Center(
              child: Text(
                'No grades available.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : Column(
              children: [
                Table(
                  border: TableBorder.symmetric(
                    borderRadius: BorderRadius.circular(10),
                    outside: const BorderSide(width: 1.5, color: Colors.grey),
                    inside: const BorderSide(width: 0.5, color: Colors.grey),
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceTint,
                      ),
                      children: [
                        Text(
                          'Full Name',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'ID',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Grade',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    ...controller.grades.map((grade) {
                      int index = controller.grades.indexOf(grade);
                      Color color = index % 2 == 0
                          ? Theme.of(context).colorScheme.surface
                          : Theme.of(context).colorScheme.surfaceTint;

                      return TableRow(
                        decoration: BoxDecoration(
                          color: color,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              grade.name ?? '-',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              grade.id?.toString() ?? '-',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GestureDetector(
                              onTap: () => controller.showUpdateGrade(grade.id),
                              child: Text(
                                grade.grade ?? 'N/A',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                MainButton(
                    onPressed: () {
                      controller.showRate();
                    },
                    text: 'rate')
              ],
            );
    });
  }
}
