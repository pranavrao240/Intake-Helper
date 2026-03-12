import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/settings_providers.dart';
import 'package:intake_helper/common_functions/units_conversion.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum MealStatus { completed, active, missed, upcoming }

class MealCardData {
  final String title;
  final String time;
  final String? protein;
  final String? calories;
  final MealStatus status;
  final VoidCallback? onTap;

  const MealCardData({
    required this.title,
    required this.time,
    required this.status,
    this.protein,
    this.calories,
    this.onTap,
  });
}

MealStatus mealStatusFromString(String? status) {
  switch (status?.toLowerCase()) {
    case 'completed':
      return MealStatus.completed;
    case 'active':
      return MealStatus.active;
    case 'missed':
      return MealStatus.missed;
    default:
      return MealStatus.upcoming;
  }
}

class _BaseMealCard extends StatelessWidget {
  final Widget child;
  final MealStatus status;
  final VoidCallback? onTap;

  const _BaseMealCard({
    required this.child,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == MealStatus.completed;
    final isMissed = status == MealStatus.missed;
    final isActive = status == MealStatus.active;

    return Opacity(
      opacity: isCompleted || isMissed ? (isMissed ? 0.35 : 0.6) : 1.0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isActive
                  ? const Color(0xFFEF4444).withOpacity(0.7)
                  : Colors.white.withOpacity(0.1),
              width: isActive ? 2 : 1,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: const Color(0xFFEF4444).withOpacity(0.2),
                      blurRadius: 30,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: child,
        ),
      ),
    );
  }
}

class CompletedMealCard extends StatelessWidget {
  final MealCardData data;
  const CompletedMealCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return _BaseMealCard(
      status: MealStatus.completed,
      onTap: data.onTap,
      child: Row(
        children: [
          _IconContainer(
            color: Color(0xFF6D28D9),
            icon: LucideIcons.checkCircle,
            status: data.status,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(height: 2),
                Text(data.time,
                    style:
                        const TextStyle(color: Colors.white30, fontSize: 12)),
              ],
            ),
          ),
          _Tag(
            text: "+${data.protein ?? '0'}g Protein",
            color: Colors.orange,
          ),
          const SizedBox(width: 8),
          const Icon(LucideIcons.checkCircle, color: Colors.orange, size: 20),
        ],
      ),
    );
  }
}

class ActiveMealCard extends HookConsumerWidget {
  final MealCardData data;
  const ActiveMealCard({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsConversion = ref.read(weightUnitProvider);

    return _BaseMealCard(
      status: MealStatus.active,
      onTap: data.onTap,
      child: Row(
        children: [
          _IconContainer(
            color: Colors.red,
            icon: LucideIcons.flame,
            status: data.status,
            isActive: true,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "${data.time} · Active now",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(
                  unitsConversion == WeightUnit.kg
                      ? "${double.parse(data.protein ?? '0').toStringAsFixed(2)} g Protein · ${double.parse(data.calories ?? '0').toStringAsFixed(0)} kcal"
                      : "${kilogramsToPounds(double.parse(data.protein ?? '0')).toStringAsFixed(2)} lb Protein · ${double.parse(data.calories ?? '0').toStringAsFixed(0)} kcal",
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MissedMealCard extends StatelessWidget {
  final MealCardData data;
  const MissedMealCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return _BaseMealCard(
      status: MealStatus.missed,
      onTap: data.onTap,
      child: Row(
        children: [
          _IconContainer(
            color: Colors.grey,
            icon: LucideIcons.x,
            status: data.status,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const SizedBox(height: 2),
                Text(
                  data.time,
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
          ),
          const _Tag(text: "Missed", color: Colors.grey, isMissed: true),
        ],
      ),
    );
  }
}

class UpcomingMealCard extends StatelessWidget {
  final MealCardData data;
  const UpcomingMealCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return _BaseMealCard(
      status: MealStatus.upcoming,
      onTap: data.onTap,
      child: Row(
        children: [
          _IconContainer(
            color: Colors.blue,
            icon: LucideIcons.utensils,
            status: data.status,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(LucideIcons.clock,
                        color: Colors.white24, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      data.time,
                      style:
                          const TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  "${data.protein ?? '0'}g Protein · ${data.calories ?? '0'} kcal",
                  style: const TextStyle(color: Colors.white24, fontSize: 12),
                ),
              ],
            ),
          ),
          const _Tag(text: "Tonight", color: Colors.blue),
        ],
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  final Color color;
  final IconData icon;
  final MealStatus status;
  final bool isActive;

  const _IconContainer({
    required this.color,
    required this.icon,
    required this.status,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMissed = status == MealStatus.missed;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isMissed
                ? Colors.white.withOpacity(0.05)
                : color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isMissed
                  ? Colors.white.withOpacity(0.08)
                  : color.withOpacity(0.2),
            ),
          ),
          child: Icon(
            icon,
            color: isMissed ? Colors.grey : color,
            size: 20,
          ),
        ),
        if (isActive)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color color;
  final bool isMissed;

  const _Tag({required this.text, required this.color, this.isMissed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color:
            isMissed ? Colors.white.withOpacity(0.06) : color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:
              isMissed ? Colors.white.withOpacity(0.1) : color.withOpacity(0.2),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isMissed ? Colors.white.withOpacity(0.5) : color,
          fontSize: 11,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
