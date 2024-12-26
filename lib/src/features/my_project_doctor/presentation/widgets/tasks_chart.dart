import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/theme/app_color.dart';

class TasksChart extends StatelessWidget {
  const TasksChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: 300,
        child: LineChart(
          LineChartData(
            titlesData: const FlTitlesData(
              show: false,
            ),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(1, 5),
                  FlSpot(2, 2),
                  FlSpot(3, 6),
                  FlSpot(4, 2),
                  FlSpot(5, 8),
                  FlSpot(6, 6),
                  FlSpot(7, 7),
                  FlSpot(8, 8),
                  FlSpot(9, 9),
                  FlSpot(10, 10),
                ],
                isCurved: false,
                color: AppColors.mainColor,
                barWidth: 2,
                dotData: const FlDotData(show: true),
              ),
              LineChartBarData(
                spots: const [
                  FlSpot(1, 1),
                  FlSpot(2, 2),
                  FlSpot(3, 3),
                  FlSpot(4, 4),
                  FlSpot(5, 5),
                  FlSpot(6, 6),
                  FlSpot(7, 7),
                  FlSpot(8, 8),
                  FlSpot(9, 9),
                  FlSpot(10, 10),
                ],
                isCurved: false,
                color: AppColors.right,
                barWidth: 2,
                dotData: const FlDotData(show: true),
              ),
            ],
          ),
        ));
  }
}
