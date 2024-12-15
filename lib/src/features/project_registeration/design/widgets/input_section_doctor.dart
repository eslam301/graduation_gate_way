import 'package:flutter/material.dart';

import '../../../../core/widgets/components/text_input_field.dart';

class InputSectionDoctor extends StatelessWidget {
  final int index;
  final TextEditingController doctorController;

  const InputSectionDoctor(
      {super.key, required this.index, required this.doctorController});

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
              'doctor ${index + 1}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextInputField.name(
              hintText: 'Doctor Name',
              controller: doctorController,
            ),
          ],
        ),
      ),
    );
  }
}
