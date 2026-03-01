import 'package:flutter/material.dart';

Widget buildMacrosCard(
    Map<String, double> macros, Map<String, double> targets) {
  print("Macros from card: $macros");
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111127),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Macros",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 28),
          _macroBar(
            label: 'CALORIES',
            current: macros['calories']!,
            target: targets['calories']!,
            unit: 'kcal',
            colors: const [Color(0xFF2563EB), Color(0xFF60A5FA)],
          ),
          _macroBar(
            label: 'PROTEIN',
            current: macros['protein']!,
            target: targets['protein']!,
            unit: 'g',
            colors: const [Color(0xFF7C3AED), Color(0xFFEC4899)],
          ),
          _macroBar(
            label: 'CARBS',
            current: macros['carbs']!,
            target: targets['carbs']!,
            unit: 'g',
            colors: const [Color(0xFF2563EB), Color(0xFF60A5FA)],
          ),
          _macroBar(
            label: 'FATS',
            current: macros['fats']!,
            target: targets['fats']!,
            unit: 'g',
            colors: const [Color(0xFF6B7280), Color(0xFF9CA3AF)],
            isLast: true,
          ),
        ],
      ),
    ),
  );
}

Widget _macroBar({
  required String label,
  required double current,
  required double target,
  required String unit,
  required List<Color> colors,
  bool isLast = false,
}) {
  final percent = (current / target).clamp(0.0, 1.0);

  return Padding(
    padding: EdgeInsets.only(bottom: isLast ? 16 : 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.45),
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.4,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${current.toInt()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' / ',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.25),
                      fontSize: 13,
                    ),
                  ),
                  TextSpan(
                    text: '${target.toInt()}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.55),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' $unit',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 5,
            color: Colors.white.withOpacity(0.07),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutCubic,
                      width: constraints.maxWidth * percent,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: colors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
