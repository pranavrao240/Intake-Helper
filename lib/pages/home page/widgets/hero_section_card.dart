import 'package:flutter/material.dart';
import 'package:intake_helper/Providers/settings_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/common_functions/units_conversion.dart';
import 'dart:math' as math;
import 'package:intake_helper/models/user_model.dart';

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress.clamp(0.0, 1.0),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter old) =>
      old.progress != progress ||
      old.color != color ||
      old.strokeWidth != strokeWidth;
}

Widget buildHeroSection(
  BuildContext context,
  Map<String, double> macros,
  Map<String, double> targets,
  double proteinPercent,
  ProfileData? profile,
  WidgetRef ref,
) {
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning";
    if (hour < 17) return "Good Afternoon";
    if (hour < 21) return "Good Evening";
    return "Good Night";
  }

  final greeting = getGreeting();
  final unitsConversion = ref.read(weightUnitProvider);

  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFF3730A3), // indigo-800
          Color(0xFF4338CA), // indigo-700
          Color(0xFF6D28D9), // violet-700
          Color(0xFF1E1B4B), // indigo-950
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFDC2626).withValues(alpha: 0.4),
          blurRadius: 30,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    padding: const EdgeInsets.fromLTRB(24, 60, 24, 90),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$greeting, ${profile?.fullName ?? 'User'}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: SizedBox(
            width: 224,
            height: 224,
            child: Stack(
              children: [
                CustomPaint(
                  size: const Size(224, 224),
                  painter: CircularProgressPainter(
                    progress: 1.0,
                    color: Colors.white.withValues(alpha: 0.15),
                    strokeWidth: 14,
                  ),
                ),
                CustomPaint(
                  size: const Size(224, 224),
                  painter: CircularProgressPainter(
                    progress: proteinPercent / 100,
                    color: Colors.white,
                    strokeWidth: 14,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PROTEIN',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 11,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        unitsConversion == WeightUnit.kg
                            ? '${macros['protein']?.toDouble().toStringAsFixed(2) ?? 0}g'
                            : '${kilogramsToPounds(macros['protein']?.toDouble() ?? 0).toStringAsFixed(2)}lb',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            fontFamily: "SF Pro Display"),
                      ),
                      Text(
                        unitsConversion == WeightUnit.kg
                            ? '/ ${targets['protein']?.toDouble().toStringAsFixed(2) ?? 0}g'
                            : '/ ${kilogramsToPounds(targets['protein']?.toDouble() ?? 0).toStringAsFixed(2)}lb',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
