import 'package:flutter/material.dart';

class GradeTable extends StatelessWidget {
  const GradeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
          borderRadius: BorderRadius.circular(10),
          outside: const BorderSide(width: 1.5, color: Colors.grey),
          inside: const BorderSide(width: 0.5, color: Colors.grey)),
      children: [
        TableRow(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceTint,
            ),
            children: [
              Text(
                'full Name',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Id',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Grade',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ]),
        ...List.generate(
          5,
          (int index) {
            Color color = index % 2 == 0
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.surfaceTint;
            return TableRow(
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                  color: color,
                ),
                children: [
                  Text(
                    'name ${index + 1}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'id ${index + 1}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'A+',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ]);
          },
        )
      ],
    );
  }
}
