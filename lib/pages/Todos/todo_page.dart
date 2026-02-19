import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/components/bottom_navbar.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_alert_banner.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_app_bar.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_category_tabs.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_date_selector.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_fab.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_meal_cards.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_progress_bar.dart';

// ─────────────────────────────────────────────
// Sample static data (replace with API data)
// ─────────────────────────────────────────────
final List<MealCardData> _sampleMeals = [
  MealCardData(
    title: 'Breakfast',
    time: '8:30 AM',
    protein: '35g',
    status: MealStatus.completed,
  ),
  MealCardData(
    title: 'Lunch - Grilled Chicken Bowl',
    time: '1:30 PM',
    protein: '35g',
    calories: '450',
    status: MealStatus.active,
  ),
  MealCardData(
    title: 'Morning Snack',
    time: '10:00 AM',
    status: MealStatus.missed,
  ),
  MealCardData(
    title: 'Dinner',
    time: '8:00 PM',
    protein: '40g',
    calories: '520',
    status: MealStatus.upcoming,
  ),
];

// ─────────────────────────────────────────────
// TodoPage
// ─────────────────────────────────────────────
class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState('All');
    final meals = useState<List<MealCardData>>(_sampleMeals);

    final completedCount =
        meals.value.where((m) => m.status == MealStatus.completed).length;

    /// Filter meals by category
    List<MealCardData> filteredMeals() {
      if (selectedCategory.value == 'All') return meals.value;
      return meals.value.where((m) {
        return m.title
            .toLowerCase()
            .contains(selectedCategory.value.toLowerCase());
      }).toList();
    }

    Widget buildMealCard(MealCardData meal) {
      switch (meal.status) {
        case MealStatus.completed:
          return CompletedMealCard(data: meal);
        case MealStatus.active:
          return ActiveMealCard(
            data: meal,
            onTap: () => debugPrint('Active meal tapped: ${meal.title}'),
          );
        case MealStatus.missed:
          return MissedMealCard(data: meal);
        case MealStatus.upcoming:
          return UpcomingMealCard(data: meal);
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,

      // ── Body ──
      body: Column(
        children: [
          // App Bar
          const TodoAppBar(),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Selector
                  const TodoDateSelector(),

                  // Category Tabs
                  TodoCategoryTabs(
                    onCategoryChanged: (cat) => selectedCategory.value = cat,
                  ),

                  // Smart Alert Banner
                  const TodoAlertBanner(
                    message: 'Lunch in 20 minutes',
                  ),

                  // Meal Cards
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: Column(
                      children: filteredMeals()
                          .map((meal) => Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: buildMealCard(meal),
                              ))
                          .toList(),
                    ),
                  ),

                  // Bottom padding so content clears the summary bar
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // Bottom Progress Bar (fixed at bottom above nav)
          TodoProgressBar(
            completed: completedCount,
            total: meals.value.length,
            motivationalText: "You're 80% closer to today's goal 💪",
          ),
        ],
      ),

      // ── FAB ──
      floatingActionButton: TodoFAB(
        onPressed: () => debugPrint('Add meal tapped'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
