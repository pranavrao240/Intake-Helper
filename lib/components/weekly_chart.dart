// ---------------- WEEKLY CHART ----------------
import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget buildWeeklyChart({
  required List<Map<String, dynamic>> chartData,
}) {
  print("chartData: $chartData");

  // Define all days in sequence
  final allDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  // Create a map of day -> protein value from chartData
  final Map<String, double> dataMap = {};
  for (var item in chartData) {
    final day = item['day'] as String;
    final protein = (item['protein'] as num).toDouble();

    // If multiple entries for same day, use the latest or sum them
    dataMap[day] = protein; // or: dataMap[day] = (dataMap[day] ?? 0) + protein;
  }

  // Create spots only for days that have data
  final List<FlSpot> spots = [];
  for (int i = 0; i < allDays.length; i++) {
    if (dataMap.containsKey(allDays[i])) {
      spots.add(FlSpot(i.toDouble(), dataMap[allDays[i]]!));
    }
  }

  // Calculate min/max for Y-axis based on available data
  double minY = 100;
  double maxY = 160;
  if (dataMap.isNotEmpty) {
    final values = dataMap.values.toList();
    minY = (values.reduce(math.min) - 20).floorToDouble();
    maxY = (values.reduce(math.max) + 20).ceilToDouble();
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weekly Protein',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF18181B),
            border: Border.all(color: const Color(0xFF27272A)),
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: 200,
            child: spots.isEmpty
                ? Center(
                    child: Text(
                      'No data available',
                      style: TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: 14,
                      ),
                    ),
                  )
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: const Color(0xFF27272A),
                            strokeWidth: 1,
                            dashArray: [5, 5],
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index >= 0 && index < allDays.length) {
                                // Highlight days with data
                                final hasData =
                                    dataMap.containsKey(allDays[index]);
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    allDays[index],
                                    style: TextStyle(
                                      color: hasData
                                          ? Colors.white
                                          : const Color(0xFFAAAAAA),
                                      fontSize: 12,
                                      fontWeight: hasData
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Color(0xFFAAAAAA),
                                  fontSize: 12,
                                ),
                              );
                            },
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          color: const Color(0xFFEF4444),
                          barWidth: 3,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 5,
                                color: const Color(0xFFEF4444),
                                strokeWidth: 2,
                                strokeColor: Colors.black,
                              );
                            },
                          ),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                      minX: 0,
                      maxX: 6, // 0-6 for Mon-Sun
                      minY: minY,
                      maxY: maxY,
                    ),
                  ),
          ),
        ),
      ],
    ),
  );
}
