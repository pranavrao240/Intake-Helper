import 'package:flutter/material.dart';
import 'dart:math' as math;

class EnergyMixCard extends StatelessWidget {
  final double? calories;
  final double? protein;
  final double? carbs;

  const EnergyMixCard({
    super.key,
    this.calories,
    this.protein,
    this.carbs,
  });

  @override
  Widget build(BuildContext context) {
    final total = (calories ?? 0) + (protein ?? 0) + (carbs ?? 0);
    final safeTotal = total == 0 ? 1.0 : total;

    final segments = [
      _Segment(
          label: 'Protein',
          value: protein ?? 0,
          percent: ((protein ?? 0) / safeTotal * 100).roundToDouble(),
          color: const Color(0xFFEF4444)),
      _Segment(
          label: 'Carbs',
          value: carbs ?? 0,
          percent: ((carbs ?? 0) / safeTotal * 100).roundToDouble(),
          color: const Color(0xFF3B82F6)),
      _Segment(
          label: 'Calories',
          value: calories ?? 0,
          percent: ((calories ?? 0) / safeTotal * 100).roundToDouble(),
          color: const Color(0xFFA1A1AA)),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ENERGY MIX',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color(0xFFEF4444).withOpacity(0.2)),
                ),
                child: const Text(
                  'BALANCED',
                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontSize: 8,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Donut + Legend
          Row(
            children: [
              // Donut chart
              SizedBox(
                width: 110,
                height: 110,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(110, 110),
                      painter: _DonutPainter(segments: segments),
                    ),
                    // Center label
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '100',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),

              // Legend
              Expanded(
                child: Column(
                  children: segments
                      .map((s) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: s.color,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      s.label,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${s.percent.toInt()}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Donut painter ────────────────────────────────────────────────────────────
class _Segment {
  final String label;
  final double value;
  final double percent;
  final Color color;
  const _Segment(
      {required this.label,
      required this.value,
      required this.percent,
      required this.color});
}

class _DonutPainter extends CustomPainter {
  final List<_Segment> segments;
  _DonutPainter({required this.segments});

  @override
  void paint(Canvas canvas, Size size) {
    final total = segments.fold(0.0, (sum, s) => sum + s.value);
    if (total == 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.shortestSide / 2;
    final innerRadius = outerRadius * 0.65;
    const gapAngle = 0.06; // gap between segments in radians

    double startAngle = -math.pi / 2;

    for (final seg in segments) {
      final sweepAngle =
          (seg.value / total) * (2 * math.pi) - gapAngle;

      final paint = Paint()
        ..color = seg.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = outerRadius - innerRadius
        ..strokeCap = StrokeCap.round;

      final radius = (outerRadius + innerRadius) / 2;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle + gapAngle / 2,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle + gapAngle;
    }
  }

  @override
  bool shouldRepaint(_DonutPainter old) => old.segments != segments;
}
