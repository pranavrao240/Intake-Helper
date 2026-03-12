import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/settings_providers.dart';
import 'package:intake_helper/common_functions/units_conversion.dart';

Widget buildWeeklyChart({
  required WidgetRef ref,
  required List<Map<String, dynamic>> chartData,
}) {
  print("chartData: $chartData");
  final unitsConversion = ref.read(weightUnitProvider);

  final allDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  final Map<String, double> dataMap = {};
  for (var item in chartData) {
    final day = item['day'] as String;
    final protein = (item['protein'] as num).toDouble();
    dataMap[day] = protein;
  }

  final List<FlSpot> spots = [];
  for (int i = 0; i < allDays.length; i++) {
    if (dataMap.containsKey(allDays[i])) {
      spots.add(FlSpot(i.toDouble(), dataMap[allDays[i]]!));
    }
  }

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
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 220,
          padding: const EdgeInsets.fromLTRB(12, 20, 16, 12),
          decoration: BoxDecoration(
            color: const Color(0xFF111127),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: spots.isEmpty
              ? const Center(
                  child: Text(
                    'No data available',
                    style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
                  ),
                )
              : LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: (maxY - minY) / 3,
                      getDrawingHorizontalLine: (_) => FlLine(
                        color: Colors.white.withOpacity(0.04),
                        strokeWidth: 1,
                        dashArray: [5, 5],
                      ),
                    ),

                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 28,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (value != index.toDouble())
                              return const SizedBox();
                            if (index < 0 || index >= allDays.length)
                              return const SizedBox();
                            final hasData = dataMap.containsKey(allDays[index]);
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                allDays[index],
                                style: TextStyle(
                                  color: hasData
                                      ? Colors.white.withOpacity(0.5)
                                      : Colors.white.withOpacity(0.2),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 36,
                          interval: (maxY - minY) / 3,
                          getTitlesWidget: (value, meta) {
                            if (value == meta.min || value == meta.max) {
                              return const SizedBox();
                            }
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.3),
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
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
                        curveSmoothness: 0.4,
                        color: const Color(0xFFEF4444),
                        barWidth: 3,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 4,
                            color: const Color(0xFFEF4444),
                            strokeWidth: 2.5,
                            strokeColor: Colors.white,
                          ),
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFEF4444).withOpacity(0.18),
                              const Color(0xFFEF4444).withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ],

                    minX: 0,
                    maxX: 6,
                    minY: minY,
                    maxY: maxY,

                    // ── Touch tooltip ──
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipColor: (_) => const Color(0xFF1E1B4B),
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((spot) {
                            final value = unitsConversion == WeightUnit.kg
                                ? '${spot.y.toDouble().toStringAsFixed(2)} g'
                                : '${kilogramsToPounds(spot.y.toDouble()).toStringAsFixed(2)} lbs';
                            return LineTooltipItem(
                              value,
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            );
                          }).toList();
                        },
                      ),
                      handleBuiltInTouches: true,
                    ),
                  ),
                ),
        ),
      ],
    ),
  );
}
