import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

LineChartData mainData() {
  return LineChartData(
    minX: 0,
    maxX: 10,
    minY: 0,
    maxY: 6,
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            String txt = '';
            switch (value.toInt()) {
              case 2:
                txt = 'Mar';
                break;
              case 5:
                txt = 'May';
                break;
              case 8:
                txt = 'Sep';
                break;
            }
            return Text(
              txt,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            String fig = '';
            switch (value.toInt()) {
              case 0:
                fig = '0';
                break;
              case 3:
                fig = '3';
                break;
              case 6:
                fig = '6';
                break;
            }
            return Text(
              fig,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            );
          },
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
    ),
    gridData: FlGridData(
      show: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey.shade300,
          strokeWidth: 1,
        );
      },
      drawVerticalLine: true,
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.grey.shade300,
          strokeWidth: 1,
        );
      },
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
    ),
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 2.5),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        color: Colors.blue,
        barWidth: 2,
        dotData: FlDotData(show: false),
      ),
    ],
  );
}
