import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/meal_notifications_provider.dart';
import 'package:intake_helper/Providers/providers.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/components/toast/toast.dart';
import 'package:intake_helper/constants/notification_priority.dart';
import 'package:intake_helper/constants/notification_type.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/energy_mix_card.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/ingredients_card.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/nutrition_bottom_bar.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/nutrition_hero_section.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/nutrition_stats_row.dart';
import 'package:intake_helper/utility/notification.dart';
import 'package:intl/intl.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class NutritionDetailScreen extends HookConsumerWidget {
  final String id;
  const NutritionDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = AppLocalizations.of(context)!;
    // ── State ──
    final portion = useState(1);
    final selectedTypes = useState<List<String>>([]);
    final showTypeError = useState(false);

    // ── Data ──
    final details = ref.watch(NutritionDetailsProvider(id));

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: details.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFEF4444)),
        ),
        error: (e, _) => Center(
          child: Text(locale.nutritionDetailsError(e.toString()),
              style: const TextStyle(color: Colors.white)),
        ),
        data: (model) => _buildBody(
          context: context,
          ref: ref,
          model: model,
          portion: portion,
          selectedTypes: selectedTypes,
          showTypeError: showTypeError,
        ),
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required WidgetRef ref,
    required Nutrition model,
    required ValueNotifier<int> portion,
    required ValueNotifier<List<String>> selectedTypes,
    required ValueNotifier<bool> showTypeError,
  }) {
    final List<Map<String, String>> ingredients = _parseIngredients(model);
    final locale = AppLocalizations.of(context)!;
    final calories = (model.calories ?? 0).toDouble();
    final protein = (model.protein ?? 0).toDouble();
    final carbs = (model.carbohydrates ?? 0).toDouble();
    final dishName = model.dishName ?? locale.nutritionDetailsUnknownDish;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: NutritionHeroSection(
                  dishName:
                      model.dishName ?? locale.nutritionDetailsUnknownDish,
                  isSaved: model.isSaved!,
                  id: model.id!,
                  imageUrl: model.dishImage),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 140),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  NutritionStatsRow(
                    calories: calories,
                    protein: protein,
                    carbs: carbs,
                    fat: null,
                  ),
                  const SizedBox(height: 16),
                  EnergyMixCard(
                    calories: calories,
                    protein: protein,
                    carbs: carbs,
                  ),
                  const SizedBox(height: 16),
                  if (ingredients.isNotEmpty) ...[
                    IngredientsCard(ingredients: ingredients),
                    const SizedBox(height: 16),
                  ],
                  _MealTypeSelector(
                    selectedTypes: selectedTypes,
                    showTypeError: showTypeError,
                  ),
                  const SizedBox(height: 16),
                  GoalInsightCard(
                    insight: model.dishName != null
                        ? locale.nutritionDetailsInsight
                        : locale.nutritionDetailsNoInsight,
                  ),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
          ],
        ),
        NutritionBottomBar(
          portion: portion.value,
          onDecrement: () {
            if (portion.value > 1) portion.value--;
          },
          onIncrement: () => portion.value++,
          onAddMeal: () => _handleAddMeal(
              context: context,
              ref: ref,
              model: model,
              selectedTypes: selectedTypes,
              showTypeError: showTypeError,
              dishName: dishName),
        ),
      ],
    );
  }

  List<Map<String, String>> _parseIngredients(Nutrition model) {
    if (model.quantityRequired == null || model.quantityRequired!.isEmpty) {
      return [];
    }

    return [
      {
        'name': model.dishName ?? 'Main Ingredient',
        'amount': model.quantityRequired ?? '',
      }
    ];
  }

  Future<void> _handleAddMeal({
    required BuildContext context,
    required WidgetRef ref,
    required Nutrition model,
    required ValueNotifier<List<String>> selectedTypes,
    required ValueNotifier<bool> showTypeError,
    required String dishName,
  }) async {
    final locale = AppLocalizations.of(context)!;
    if (selectedTypes.value.isEmpty) {
      showTypeError.value = true;

      return;
    }

    TimeOfDay selectedTime = TimeOfDay.now();
    List<String> selectedDays = [];

    await showDialog(
      context: context,
      builder: (ctx) => _TimeDayPickerDialog(
        onConfirm: (time, days) {
          selectedTime = time;
          selectedDays = days;
        },
        dishName: dishName,
      ),
    );

    if (selectedDays.isEmpty) return;

    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    final formattedTime = DateFormat('HH:mm').format(dt);

    final success = await ApiService().addTodoItem(
      model.id ?? '',
      [formattedTime],
      selectedDays,
      selectedTypes.value,
    );

    if (!context.mounted) return;

    if (success == true) {
      showToast(locale.nutritionDetailsAddedToTodo, context, 1);
      context.push('/todo');
    } else {
      showToast(locale.nutritionDetailsFailedToAdd, context, 2);
    }
  }
}

class _MealTypeSelector extends StatelessWidget {
  final ValueNotifier<List<String>> selectedTypes;
  final ValueNotifier<bool> showTypeError;
  const _MealTypeSelector({
    required this.selectedTypes,
    required this.showTypeError,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final _types = [
      locale.mealTypeBreakfast,
      locale.mealTypeLunch,
      locale.mealTypeDinner
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              locale.nutritionDetailsMealType,
              style: TextStyle(
                color: showTypeError.value
                    ? const Color(0xFFEF4444)
                    : Colors.white.withValues(alpha: 0.4),
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            if (showTypeError.value)
              Text(
                locale.nutritionDetailsSelectMealType,
                style: const TextStyle(
                  color: Color(0xFFEF4444),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: _types.map((type) {
            final isSelected = selectedTypes.value.contains(type);
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  final updated = List<String>.from(selectedTypes.value);
                  isSelected ? updated.remove(type) : updated.add(type);
                  selectedTypes.value = updated;
                  if (updated.isNotEmpty) {
                    showTypeError.value = false;
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEF4444).withValues(alpha: 0.15)
                        : Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFEF4444).withValues(alpha: 0.5)
                          : Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xFFEF4444)
                          : Colors.white.withValues(alpha: 0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _TimeDayPickerDialog extends HookConsumerWidget {
  final void Function(TimeOfDay time, List<String> days) onConfirm;
  final String dishName;

  const _TimeDayPickerDialog({
    required this.onConfirm,
    required this.dishName,
  });

  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = useState(TimeOfDay.now());
    final selectedDays = useState<Set<String>>({});
    final locale = AppLocalizations.of(context)!;

    return AlertDialog(
      backgroundColor: const Color(0xFF18181B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        locale.scheduleMealDialogTitle,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: selectedTime.value,
                builder: (ctx, child) =>
                    Theme(data: ThemeData.dark(), child: child!),
              );
              if (picked != null) selectedTime.value = picked;
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444).withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
                border:
                    Border.all(color: const Color(0xFFEF4444).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time,
                      color: Color(0xFFEF4444), size: 16),
                  const SizedBox(width: 8),
                  Text(
                    selectedTime.value.format(context),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            locale.scheduleMealDialogSelectDays,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _days.map((day) {
              final isSelected = selectedDays.value.contains(day);
              return GestureDetector(
                onTap: () {
                  final updated = Set<String>.from(selectedDays.value);
                  isSelected ? updated.remove(day) : updated.add(day);
                  selectedDays.value = updated;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEF4444)
                        : Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFEF4444)
                          : Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      day,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.5),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(locale.scheduleMealDialogCancel,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.5))),
        ),
        TextButton(
          onPressed: () async {
            if (selectedDays.value.isEmpty) {
              showToast(locale.nutritionDetailsSelectDay, context, 2);
              return;
            }

            onConfirm(selectedTime.value, selectedDays.value.toList());

            ref.read(mealNotificationProvider.notifier).createNotification(
                  title: locale.notificationMealTimeTitle,
                  message: locale.notificationMealTimeBody(dishName),
                  priority: NotificationPriority.high.name,
                  type: NotificationType.mealReminder.apiValue,
                );

            await CustomNotification().showScheduleNotification(
              1,
              locale.notificationMealTimeTitle,
              locale.notificationMealTimeBody(dishName),
              selectedTime.value.hour,
              selectedTime.value.minute,
            );

            if (context.mounted) context.pop();
          },
          child: Text(locale.scheduleMealDialogAdd,
              style: const TextStyle(
                  color: Color(0xFFEF4444), fontWeight: FontWeight.w800)),
        ),
      ],
    );
  }
}
