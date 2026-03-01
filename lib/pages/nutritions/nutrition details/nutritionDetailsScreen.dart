import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/providers.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/energy_mix_card.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/ingredients_card.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/nutrition_bottom_bar.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/nutrition_hero_section.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20details/widgets/nutrition_stats_row.dart';
import 'package:intl/intl.dart';

class NutritionDetailScreen extends HookConsumerWidget {
  final String id;
  const NutritionDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ── State ──
    final portion = useState(1);
    final selectedTypes = useState<List<String>>([]);

    // ── Data ──
    final details = ref.watch(NutritionDetailsProvider(id));

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: details.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFEF4444)),
        ),
        error: (e, _) => Center(
          child: Text('Error: $e', style: const TextStyle(color: Colors.white)),
        ),
        data: (model) => _buildBody(
          context: context,
          ref: ref,
          model: model,
          portion: portion,
          selectedTypes: selectedTypes,
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
  }) {
    // Build ingredients from quantityRequired field (adjust to your model)
    final List<Map<String, String>> ingredients = _parseIngredients(model);

    // Macro data for donut
    final calories = (model.calories ?? 0).toDouble();
    final protein = (model.protein ?? 0).toDouble();
    final carbs = (model.carbohydrates ?? 0).toDouble();

    print('calories: $calories');
    print('protein: $protein');
    print('carbs: $carbs');
    print('nutrition Id: ${model.id}');

    return Stack(
      children: [
        // ── Scrollable content ──
        CustomScrollView(
          slivers: [
            // Hero image (non-scrolling pinned at top)
            SliverToBoxAdapter(
              child: NutritionHeroSection(
                dishName: model.dishName ?? 'Unknown Dish',
                tag: model.type?.isNotEmpty == true ? model.type!.first : '',
                imageUrl:
                    'https://images.unsplash.com/photo-1679279726937-122c49626802?auto=format&amp;fit=crop&amp;w=1080&amp;q=80', // Pass image URL if available in your model
              ),
            ),

            // Body content
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 140),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // ── Stats row ──
                  NutritionStatsRow(
                    calories: calories,
                    protein: protein,
                    carbs: carbs,
                    fat: null, // Add fat field if available in your model
                  ),
                  const SizedBox(height: 16),

                  // ── Energy mix donut ──
                  EnergyMixCard(
                    calories: calories,
                    protein: protein,
                    carbs: carbs,
                  ),
                  const SizedBox(height: 16),

                  // ── Ingredients ──
                  if (ingredients.isNotEmpty) ...[
                    IngredientsCard(ingredients: ingredients),
                    const SizedBox(height: 16),
                  ],

                  // ── Meal type selector ──
                  _MealTypeSelector(
                    selectedTypes: selectedTypes,
                  ),
                  const SizedBox(height: 16),

                  // ── Goal insight ──
                  GoalInsightCard(
                    insight: model.dishName != null
                        ? 'This meal is optimized for your daily nutrition goals. '
                            'Track consistently for best results.'
                        : 'No insight available.',
                  ),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
          ],
        ),

        // ── Floating bottom bar ──
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
          ),
        ),
      ],
    );
  }

  // ── Parse ingredients from model ──────────────────────────────────────────
  List<Map<String, String>> _parseIngredients(Nutrition model) {
    // quantityRequired often holds ingredient info as a formatted string.
    // Adapt this logic to match your actual model structure.
    if (model.quantityRequired == null || model.quantityRequired!.isEmpty) {
      return [];
    }

    // If quantityRequired is a single value like "200g", show it as one item
    return [
      {
        'name': model.dishName ?? 'Main Ingredient',
        'amount': model.quantityRequired ?? '',
      }
    ];
  }

  // ── Add meal handler ──────────────────────────────────────────────────────
  Future<void> _handleAddMeal({
    required BuildContext context,
    required WidgetRef ref,
    required Nutrition model,
    required ValueNotifier<List<String>> selectedTypes,
  }) async {
    if (selectedTypes.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one meal type'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
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
      ),
    );

    if (selectedDays.isEmpty) return;

    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
    final formattedTime = DateFormat('HH:mm').format(dt);

    final success = await ApiService().addTodoItem(
      model.id ?? '',
      formattedTime,
      selectedDays.join(','),
      selectedTypes.value.join(','),
    );

    if (!context.mounted) return;

    if (success == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added to Todo List'),
          backgroundColor: Color(0xFF22C55E),
        ),
      );
      context.push('/todo');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add to Todo List'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
    }
  }
}

// ── Meal type selector ───────────────────────────────────────────────────────
class _MealTypeSelector extends StatelessWidget {
  final ValueNotifier<List<String>> selectedTypes;
  const _MealTypeSelector({required this.selectedTypes});

  static const _types = ['Breakfast', 'Lunch', 'Dinner'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MEAL TYPE',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
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
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEF4444).withOpacity(0.15)
                        : Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFEF4444).withOpacity(0.5)
                          : Colors.white.withOpacity(0.1),
                    ),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xFFEF4444)
                          : Colors.white.withOpacity(0.5),
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

// ── Time & day picker dialog ─────────────────────────────────────────────────
class _TimeDayPickerDialog extends StatefulWidget {
  final void Function(TimeOfDay time, List<String> days) onConfirm;
  const _TimeDayPickerDialog({required this.onConfirm});

  @override
  State<_TimeDayPickerDialog> createState() => _TimeDayPickerDialogState();
}

class _TimeDayPickerDialogState extends State<_TimeDayPickerDialog> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  final _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final Set<String> _selectedDays = {};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF18181B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'Schedule Meal',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time picker button
          GestureDetector(
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: _selectedTime,
                builder: (ctx, child) =>
                    Theme(data: ThemeData.dark(), child: child!),
              );
              if (picked != null) setState(() => _selectedTime = picked);
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
                    _selectedTime.format(context),
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

          // Day selector
          Text(
            'SELECT DAYS',
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
              final isSelected = _selectedDays.contains(day);
              return GestureDetector(
                onTap: () => setState(() {
                  isSelected
                      ? _selectedDays.remove(day)
                      : _selectedDays.add(day);
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEF4444)
                        : Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFFEF4444)
                          : Colors.white.withOpacity(0.1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      day,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
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
          child: Text('Cancel',
              style: TextStyle(color: Colors.white.withOpacity(0.5))),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(_selectedTime, _selectedDays.toList());
            context.pop();
          },
          child: const Text('Add',
              style: TextStyle(
                  color: Color(0xFFEF4444), fontWeight: FontWeight.w800)),
        ),
      ],
    );
  }
}
