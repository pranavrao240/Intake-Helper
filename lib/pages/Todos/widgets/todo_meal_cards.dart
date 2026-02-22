import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum MealStatus { completed, active, missed, upcoming }

class MealCardData {
  final String title;
  final String time;
  final String? protein;
  final String? calories;
  final MealStatus status;
  final bool isChecked;
  final VoidCallback? onTap;

  const MealCardData({
    required this.title,
    required this.time,
    required this.status,
    this.protein,
    this.calories,
    this.isChecked = false,
    this.onTap,
  });

  MealCardData copyWith({
    String? title,
    String? time,
    String? protein,
    String? calories,
    MealStatus? status,
    bool? isChecked,
    VoidCallback? onTap,
  }) {
    return MealCardData(
      title: title ?? this.title,
      time: time ?? this.time,
      protein: protein ?? this.protein,
      calories: calories ?? this.calories,
      status: status ?? this.status,
      isChecked: isChecked ?? this.isChecked,
      onTap: onTap ?? this.onTap,
    );
  }
}

MealStatus mealStatusFromString(String? status) {
  switch (status?.toLowerCase()) {
    case 'completed':
      return MealStatus.completed;
    case 'missed':
      return MealStatus.missed;
    case 'upcoming':
      return MealStatus.upcoming;
    case 'active':
    default:
      return MealStatus.active;
  }
}

class CompletedMealCard extends HookConsumerWidget {
  final MealCardData data;
  const CompletedMealCard({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: data.onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF18181B),
          borderRadius: BorderRadius.circular(24),
          border:
              Border.all(color: const Color(0xFF2563EB).withValues(alpha: 0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                    data.isChecked
                        ? Icons.check_circle_rounded
                        : Icons.circle_outlined,
                    color: data.isChecked ? Color(0xFF3B82F6) : Colors.white54,
                    size: 32),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 15,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.white54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.time,
                      style: const TextStyle(
                          color: Color(0xFF71717A), fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            if (data.protein != null)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '+${data.protein} Protein',
                  style:
                      const TextStyle(color: Color(0xFF60A5FA), fontSize: 11),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ActiveMealCard extends HookConsumerWidget {
  final MealCardData data;
  final VoidCallback? onTap;
  const ActiveMealCard({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF18181B),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFEF4444), width: 2),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFEF4444).withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF3F3F46), width: 2),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.time,
                  style: const TextStyle(
                      color: Color(0xFFF87171),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                if (data.protein != null || data.calories != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '${data.protein != null ? '${data.protein} Protein' : ''}${data.protein != null && data.calories != null ? ' • ' : ''}${data.calories != null ? '${data.calories} kcal' : ''}',
                    style:
                        const TextStyle(color: Color(0xFF71717A), fontSize: 12),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MissedMealCard extends HookConsumerWidget {
  final MealCardData data;
  const MissedMealCard({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF18181B),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF27272A)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xFF3F3F46), width: 2),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                    const SizedBox(height: 4),
                    Text(data.time,
                        style: const TextStyle(
                            color: Color(0xFF71717A), fontSize: 12)),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFF3F3F46),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Missed',
                style: TextStyle(color: Color(0xFFD4D4D8), fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingMealCard extends HookConsumerWidget {
  final MealCardData data;
  const UpcomingMealCard({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF3F3F46), width: 2),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
              const SizedBox(height: 4),
              Text(data.time,
                  style:
                      const TextStyle(color: Color(0xFF71717A), fontSize: 12)),
              if (data.protein != null || data.calories != null) ...[
                const SizedBox(height: 4),
                Text(
                  '${data.protein != null ? '${data.protein} Protein' : ''}${data.protein != null && data.calories != null ? ' • ' : ''}${data.calories != null ? '${data.calories} kcal' : ''}',
                  style:
                      const TextStyle(color: Color(0xFF71717A), fontSize: 12),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
