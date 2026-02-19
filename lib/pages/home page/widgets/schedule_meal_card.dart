// ---------------- SCHEDULED MEALS ----------------
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Today's Schedule",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () => context.push(RouteConstants.todo.path),
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Color(0xFFEF4444),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          itemCount: todoData!.meals.length,
          itemBuilder: (context, index) {
            return _scheduleItem(
              '${todoData.meals[index].nutrition.type!.first} - ${todoData.meals[index].nutrition.time!.first}',
              false,
              true,
              () {
                context.pushNamed(
                  RouteConstants.mealDetails.name,
                  pathParameters: {'id': todoData.meals[index].nutrition.id!},
                );
              },
              completedTasks.contains(todoData.meals[index].nutrition.id!),
            );
          },
        ),
        const SizedBox(height: 12),
      ],
    ),
  );
}

Widget _scheduleItem(String text, bool completed, bool upcoming,
    VoidCallback? onTap, bool isCompleted) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCompleted
            ? const Color(0xFF14532D).withValues(alpha: 0.3)
            : upcoming
                ? const Color(0xFF7F1D1D).withValues(alpha: 0.3)
                : const Color(0xFF18181B),
        border: Border.all(
          color: isCompleted
              ? const Color(0xFF16A34A)
              : upcoming
                  ? const Color(0xFFDC2626)
                  : const Color(0xFF27272A),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          if (isCompleted)
            const Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 20),
          if (isCompleted == false && upcoming == true)
            const Icon(Icons.notifications, color: Color(0xFFEF4444), size: 20),
        ],
      ),
    ),
  );
}
