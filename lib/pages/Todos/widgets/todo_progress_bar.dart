import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoProgressBar extends HookConsumerWidget {
  final int completed;
  final int total;
  final String? motivationalText;

  const TodoProgressBar({
    super.key,
    required this.completed,
    required this.total,
    this.motivationalText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final percent = total == 0 ? 0.0 : completed / total;
    final percentLabel = '${(percent * 100).round()}%';

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 20),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.08)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$completed/$total Meals Completed',
                style: const TextStyle(
                    color: Color(0xFF71717A), fontSize: 13),
              ),
              Text(
                percentLabel,
                style: const TextStyle(
                    color: Color(0xFF71717A), fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Container(
                  height: 10,
                  width: double.infinity,
                  color: const Color(0xFF27272A),
                ),
                AnimatedFractionallySizedBox(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  widthFactor: percent,
                  child: Container(
                    height: 10,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFDC2626), Color(0xFF2563EB)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            motivationalText ?? "You're 80% closer to today's goal 💪",
            style:
                const TextStyle(color: Color(0xFF71717A), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
