import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_meal_cards.dart';

class MealActionDialog extends HookConsumerWidget {
  final MealCardData meal;
  final ValueChanged<DateTime> onComplete;
  final VoidCallback onDelete;

  const MealActionDialog({
    super.key,
    required this.meal,
    required this.onComplete,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF18181B),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFF3F3F46)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 32,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: _MainView(
          meal: meal,
          onMarkComplete: () {
            Navigator.of(context).pop();
            onComplete(DateTime.now());
          },
          onDelete: () {
            Navigator.of(context).pop();
            onDelete();
          },
          onCancel: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  final MealCardData meal;
  final VoidCallback onMarkComplete;
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const _MainView({
    required this.meal,
    required this.onMarkComplete,
    required this.onDelete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.restaurant_rounded,
                  color: Color(0xFF3B82F6), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Meal Action',
                    style: TextStyle(
                      color: Color(0xFF71717A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    meal.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onCancel,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF27272A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.close_rounded,
                    color: Color(0xFF71717A), size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 54),
          child: Text(
            meal.time,
            style: const TextStyle(color: Color(0xFF71717A), fontSize: 12),
          ),
        ),
        const SizedBox(height: 24),
        const Divider(color: Color(0xFF27272A), height: 1),
        const SizedBox(height: 20),
        const Text(
          'What would you like to do?',
          style: TextStyle(
            color: Color(0xFFA1A1AA),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        _ActionTile(
          icon: Icons.check_circle_rounded,
          iconColor: const Color(0xFF22C55E),
          iconBgColor: const Color(0xFF22C55E).withValues(alpha: 0.12),
          title: 'Mark as Completed',
          subtitle: 'Confirm completion for today',
          borderColor: const Color(0xFF22C55E).withValues(alpha: 0.3),
          onTap: onMarkComplete,
        ),
        const SizedBox(height: 10),
        _ActionTile(
          icon: Icons.delete_rounded,
          iconColor: const Color(0xFFEF4444),
          iconBgColor: const Color(0xFFEF4444).withValues(alpha: 0.12),
          title: 'Delete Meal',
          subtitle: 'Remove this meal from your plan',
          borderColor: const Color(0xFFEF4444).withValues(alpha: 0.3),
          onTap: onDelete,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: onCancel,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: Color(0xFF3F3F46)),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                  color: Color(0xFF71717A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final Color borderColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.borderColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF09090B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style:
                        const TextStyle(color: Color(0xFF71717A), fontSize: 12),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                color: iconColor.withValues(alpha: 0.6), size: 20),
          ],
        ),
      ),
    );
  }
}

Future<void> showMealActionDialog({
  required BuildContext context,
  required MealCardData meal,
  required ValueChanged<DateTime> onComplete,
  required VoidCallback onDelete,
}) {
  return showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.7),
    builder: (_) => MealActionDialog(
      meal: meal,
      onComplete: onComplete,
      onDelete: onDelete,
    ),
  );
}
