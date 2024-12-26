import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime date;
  final bool isDone;
  final bool isLast;
  final bool isFirst;

  const TaskItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isDone,
    required this.isLast,
    required this.isFirst,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
          width: 30,
          color: isDone ? Colors.green : Colors.grey,
          indicator: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? Colors.green : Colors.grey,
              ),
              child: isDone
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    )
                  : null)),
      beforeLineStyle: LineStyle(
        color: isDone ? Colors.green : Colors.grey,
        thickness: 2,
      ),
      endChild: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(date.hour.toString()),
      ),
    );
  }
}
