import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/meal_info.dart';
import 'nutrition_chip.dart';

class SelectableMealCard extends HookConsumerWidget {
  final MealInfo mealInfo;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableMealCard({
    super.key,
    required this.mealInfo,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(color: const Color(0xFF00E599), width: 2)
              : Border.all(color: Colors.white12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF00E599).withOpacity(0.15),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealInfo.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    mealInfo.mealType,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    mealInfo.quantity,
                    style: const TextStyle(
                      color: Color(0xFFB0B0B0),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: [
                      NutritionChip(
                        label: 'Calories',
                        value: '${mealInfo.calories.toStringAsFixed(0)} kcal',
                      ),
                      NutritionChip(
                        label: 'Protein',
                        value: '${mealInfo.protein.toStringAsFixed(1)} g',
                      ),
                      NutritionChip(
                        label: 'Carbs',
                        value: '${mealInfo.carbs.toStringAsFixed(1)} g',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isSelected ? Icons.check_circle : Icons.circle_outlined,
                key: ValueKey(isSelected),
                color: isSelected ? const Color(0xFF00E599) : Colors.grey,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
