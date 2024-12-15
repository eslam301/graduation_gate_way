import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/components/text_input_field.dart';

class InputSectionStudent extends StatelessWidget {
  final int index;
  final TextEditingController nameController;
  final TextEditingController idController;

  const InputSectionStudent({
    super.key,
    required this.index,
    required this.nameController,
    required this.idController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student ${index + 1}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextInputField.name(
              hintText: 'Student Name',
              controller: nameController,
            ),
            TextInputField.number(
              hintText: 'Student Id',
              controller: idController,
            ),
          ],
        ),
      ),
    );
  }
}
