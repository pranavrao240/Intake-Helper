import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/meal_info.dart';
import 'selectable_meal_card.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class MealPlanDialog extends HookConsumerWidget {
  final List<MealInfo> mealInfos;

  const MealPlanDialog({super.key, required this.mealInfos});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState<Set<MealInfo>>({});
    final locale = AppLocalizations.of(context)!;

    void toggleMeal(MealInfo meal) {
      final updated = Set<MealInfo>.from(selected.value);
      updated.contains(meal) ? updated.remove(meal) : updated.add(meal);
      selected.value = updated;
    }

    return Dialog(
      backgroundColor: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.white.withOpacity(0.08)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locale.mealPlanDialogTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              locale.mealPlanDialogSelectedCount(
                  selected.value.length, mealInfos.length),
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 16),

            // Meal list
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: mealInfos
                      .map(
                        (info) => SelectableMealCard(
                          mealInfo: info,
                          isSelected: selected.value.contains(info),
                          onTap: () => toggleMeal(info),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    locale.mealPlanDialogClose,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: selected.value.isEmpty
                      ? null
                      : () => Navigator.pop(context, selected.value.toList()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E599),
                    foregroundColor: Colors.black,
                    disabledBackgroundColor:
                        const Color(0xFF00E599).withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: Text(
                    locale.mealPlanDialogSaveSelected,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
