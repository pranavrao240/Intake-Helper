import 'package:flutter/material.dart';

class NutritionStatsRow extends StatelessWidget {
  final double? calories;
  final double? protein;
  final double? carbs;
  final double? fat;

  const NutritionStatsRow({
    super.key,
    this.calories,
    this.protein,
    this.carbs,
    this.fat,
  });

  @override
  Widget build(BuildContext context) {
    final stats = [
      _StatData(
        label: 'KCAL',
        value: '${calories?.toInt() ?? 0}',
        color: const Color(0xFFEF4444),
      ),
      _StatData(
        label: 'PROTEIN',
        value: '${protein?.toInt() ?? 0}g',
        color: const Color(0xFF60A5FA),
      ),
      _StatData(
        label: 'CARBS',
        value: '${carbs?.toInt() ?? 0}g',
        color: const Color(0xFFFB923C),
      ),
      _StatData(
        label: 'FAT',
        value: '${fat?.toInt() ?? 0}g',
        color: const Color(0xFFA1A1AA),
      ),
    ];

    return Row(
      children: stats
          .map((s) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _StatCard(data: s),
                ),
              ))
          .toList(),
    );
  }
}

class _StatCard extends StatelessWidget {
  final _StatData data;
  const _StatCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.value,
            style: TextStyle(
              color: data.color,
              fontSize: 17,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 8,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatData {
  final String label;
  final String value;
  final Color color;
  const _StatData(
      {required this.label, required this.value, required this.color});
}
