import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:intake_helper/router.dart';

Widget buildScheduledMeals(
    BuildContext context, TodoModel? todoData, List<String> completedTasks) {
  print('Completed tasks from schedule meal card: $completedTasks');

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ──────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Today's Schedule",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
              ),
            ),
            GestureDetector(
              onTap: () => context.push(RouteConstants.todo.path),
              child: const Text(
                'VIEW ALL',
                style: TextStyle(
                  color: Color(0xFF6366F1), // indigo-blue matching screenshot
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // ── Meal list ────────────────────────────────────────
        if (todoData == null || todoData.meals.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'No meals scheduled',
                style: TextStyle(color: Colors.white38, fontSize: 14),
              ),
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todoData.meals.length > 3 ? 3 : todoData.meals.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final meal = todoData.meals[index];
              final isCompleted =
                  completedTasks.contains(meal.nutrition.id ?? '');
              final visibleCount =
                  todoData.meals.length > 3 ? 3 : todoData.meals.length;
              final isUpcoming = !isCompleted && index == visibleCount - 1;

              final label =
                  '${meal.nutrition.type?.first ?? ''} - ${meal.nutrition.time?.first ?? ''}';

              return _scheduleItem(
                label: label,
                isCompleted: isCompleted,
                isUpcoming: isUpcoming,
                onTap: () => context.pushNamed(
                  RouteConstants.mealDetails.name,
                  pathParameters: {'id': meal.nutrition.id ?? ''},
                ),
              );
            },
          ),
      ],
    ),
  );
}

Widget _scheduleItem({
  required String label,
  required bool isCompleted,
  required bool isUpcoming,
  VoidCallback? onTap,
}) {
  final Color bgColor;
  final Color borderColor;

  if (isCompleted) {
    bgColor = const Color(0xFF0D1F14);
    borderColor = const Color(0xFF22C55E).withOpacity(0.35);
  } else if (isUpcoming) {
    bgColor = const Color(0xFF0F0F2A);
    borderColor = const Color(0xFF6366F1).withOpacity(0.4);
  } else {
    bgColor = const Color(0xFF0F0F1E);
    borderColor = Colors.white.withOpacity(0.08);
  }

  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor, width: 1.2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isCompleted
                  ? Colors.white.withOpacity(0.35)
                  : Colors.white.withOpacity(0.92),
              fontSize: 15,
              fontWeight: FontWeight.w700,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
              decorationColor: Colors.white.withOpacity(0.35),
              decorationThickness: 1.5,
            ),
          ),
          if (isCompleted)
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                color: Color(0xFF22C55E),
                size: 18,
              ),
            )
          else if (isUpcoming)
            // Purple bell
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: Color(0xFF6366F1),
                size: 18,
              ),
            )
          else
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    ),
  );
}
