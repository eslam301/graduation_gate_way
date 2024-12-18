import 'package:flutter/material.dart';
import 'package:graduation_gate_way/src/core/widgets/components/text_input_field.dart';

class InputSectionStudent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController idController;

  const InputSectionStudent({
    super.key,
    required this.nameController,
    required this.idController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
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
              'Student',
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
