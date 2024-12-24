import 'package:expense_tracker/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OverviewLineChart extends StatefulWidget {
  const OverviewLineChart({super.key});

  @override
  State<OverviewLineChart> createState() => _OverviewLineChartState();
}

class _OverviewLineChartState extends State<OverviewLineChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 7,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(1, 1),
                FlSpot(2, 4),
                FlSpot(3, 3),
                FlSpot(4, 5),
                FlSpot(5, 2),
                FlSpot(6, 4),
                FlSpot(7, 2)
              ],
              isCurved: true,
              color: kMainColor,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    kMainColor.withOpacity(0.3),
                    kMainColor.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
