import 'package:flutter/material.dart';

Widget buildMacrosCard(
    Map<String, double> macros, Map<String, double> targets) {
  print("Macros from card: $macros");
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        border: Border.all(color: const Color(0xFF27272A)),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Macros",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          _macroBar('Calories', macros['calories']!, targets['calories']!,
              'kcal', const [Color(0xFF2563EB), Color(0xFF3B82F6)]),
          const SizedBox(height: 20),
          _macroBar('Protein', macros['protein']!, targets['protein']!, 'g',
              const [Color(0xFFDC2626), Color(0xFFEF4444)]),
          const SizedBox(height: 20),
          _macroBar('Carbs', macros['carbs']!, targets['carbs']!, 'g',
              const [Color(0xFF3B82F6), Color(0xFF60A5FA)]),
          const SizedBox(height: 20),
          _macroBar('Fats', macros['fats']!, targets['fats']!, 'g',
              const [Color(0xFF9CA3AF), Color(0xFFD1D5DB)]),
        ],
      ),
    ),
  );
}

Widget _macroBar(String label, double current, double target, String unit,
    List<Color> colors) {
  final percent = (current / target).clamp(0.0, 1.0);

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(
            '${current.toInt()}$unit / ${target.toInt()}$unit',
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Container(
        height: 12,
        decoration: BoxDecoration(
          color: const Color(0xFF27272A),
          borderRadius: BorderRadius.circular(6),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: percent,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    ],
  );
}
