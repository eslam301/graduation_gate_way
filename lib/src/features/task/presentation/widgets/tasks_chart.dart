import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/theme/app_color.dart';

class TasksChart extends StatelessWidget {
  final List<FlSpot> doneSpots;
  final List<FlSpot> notDoneSpots;

  const TasksChart(
      {super.key, required this.doneSpots, required this.notDoneSpots});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: 300,
        child: LineChart(
          curve: Curves.fastOutSlowIn,
          LineChartData(
            minY: 0,
            minX: 0,
            titlesData: const FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  maxIncluded: true,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 30,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 30,
                ),
              ),
              show: true,
            ),
            lineBarsData: [
              LineChartBarData(
                spots: notDoneSpots,
                isCurved: false,
                color: AppColors.mainColor,
                barWidth: 2,
                dotData: const FlDotData(show: true),
              ),
              LineChartBarData(
                spots: doneSpots,
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
