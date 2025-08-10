import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TripleBarChart extends StatelessWidget {
  const TripleBarChart({super.key});
  static const List<String> days = [
    S.mon,
    S.tue,
    S.wed,
    S.thu,
    S.fri,
    S.sat,
    S.sun,
  ];

  @override
  Widget build(final BuildContext context) => BarChart(
    BarChartData(
      barGroups: _generateGroups(),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget:
                (final value, final meta) => Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    days[value.toInt()],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          ),
        ),
        leftTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        rightTitles: const AxisTitles(),
      ),
      gridData: const FlGridData(),
      borderData: FlBorderData(show: false),
      barTouchData: const BarTouchData(enabled: true),
      groupsSpace: 10,
      maxY: 20,
    ),
  );

  List<BarChartGroupData> _generateGroups() => List.generate(
    7,
    (final groupIndex) => BarChartGroupData(
      x: groupIndex,
      barsSpace: 5,
      barRods: [
        BarChartRodData(toY: 9, width: 4, color: AppColors.indicatorColor1),
        BarChartRodData(toY: 13, width: 4, color: AppColors.indicatorColor2),
        BarChartRodData(toY: 5, width: 4, color: AppColors.indicatorColor3),
      ],
    ),
  );
}
