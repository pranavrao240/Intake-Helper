import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/settings_providers.dart';
import 'package:intake_helper/common_functions/units_conversion.dart';

class NutritionStatsRow extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsConversion = ref.read(weightUnitProvider);
    final isKg = unitsConversion == WeightUnit.kg;

    final stats = [
      _StatData(
        label: isKg ? 'KCAL' : 'LB CAL',
        value: isKg
            ? '${calories?.toInt() ?? 0}'
            : '${kilogramsToPounds(calories?.toDouble() ?? 0).toInt()}',
        color: const Color(0xFFEF4444),
      ),
      _StatData(
        label: 'PROTEIN',
        value: isKg
            ? '${protein?.toInt() ?? 0}g'
            : '${kilogramsToPounds(protein?.toDouble() ?? 0).toInt()} lb',
        color: const Color(0xFF60A5FA),
      ),
      _StatData(
        label: 'CARBS',
        value: isKg
            ? '${carbs?.toInt() ?? 0}g'
            : '${kilogramsToPounds(carbs?.toDouble() ?? 0).toInt()} lb',
        color: const Color(0xFFFB923C),
      ),
      _StatData(
        label: 'FAT',
        value: isKg
            ? '${fat?.toInt() ?? 0}g'
            : '${kilogramsToPounds(fat?.toDouble() ?? 0).toInt()} lb',
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
