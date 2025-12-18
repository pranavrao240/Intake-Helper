import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StatsCard extends HookConsumerWidget {
  final String title;
  final String value;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const StatsCard(
      {required this.title,
      required this.value,
      required this.gradientColors,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 90,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: gradientColors.last.withOpacity(0.4),
                blurRadius: 6,
                offset: const Offset(2, 4))
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 6),
              Text(value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
