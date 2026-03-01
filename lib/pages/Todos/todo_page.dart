import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/providers.dart';
import 'package:intake_helper/components/bottom_navbar.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:intake_helper/pages/Todos/widgets/meal_action_dialog.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_app_bar.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_category_tabs.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_date_selector.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_fab.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_meal_cards.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_progress_bar.dart';
import 'package:intake_helper/router.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState('All');
    final selectedDate = useState(DateTime.now());
    final refreshKey = useState(0);
    final deletedIds = useState<Set<String>>({});
    final todosState = ref.read(appProvider.notifier);

    final mealsFuture = useMemoized<Future<List<Meal>>>(
      () =>
          todosState.getTodo().then((value) => value?.data?.meals ?? <Meal>[]),
      [refreshKey.value],
    );

    Future<void> markComplete(String mealId, DateTime date) async {
      await todosState.updateMealStatus(mealId, 'completed');
      refreshKey.value++;
    }

    Future<void> deleteMeal(String mealId) async {
      deletedIds.value = {...deletedIds.value, mealId};
      await todosState.deleteTodoItem(mealId);
      refreshKey.value++;
    }

    MealStatus resolveStatus(Meal meal) {
      return mealStatusFromString(meal.status);
    }

    String dayName(DateTime date) {
      const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return days[date.weekday - 1];
    }

    Widget buildMealCard(Meal meal) {
      final cardData = MealCardData(
        title: meal.nutrition.dishName ?? '',
        time: meal.nutrition.time?.toString() ?? '',
        status: resolveStatus(meal),
        protein: meal.nutrition.protein.toString(),
        calories: meal.nutrition.calories.toString(),
        onTap: () {
          showMealActionDialog(
            context: context,
            meal: MealCardData(
              title: meal.nutrition.dishName ?? '',
              time: meal.nutrition.time?.toString() ?? '',
              status: resolveStatus(meal),
            ),
            onComplete: (date) => markComplete(meal.nutrition.id!, date),
            onDelete: () => deleteMeal(meal.nutrition.id!),
          );
        },
      );

      switch (cardData.status) {
        case MealStatus.completed:
          return CompletedMealCard(data: cardData);
        case MealStatus.active:
          return ActiveMealCard(data: cardData);
        case MealStatus.missed:
          return MissedMealCard(data: cardData);
        case MealStatus.upcoming:
          return UpcomingMealCard(data: cardData);
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          FutureBuilder<List<Meal>>(
            key: ValueKey(refreshKey.value),
            future: mealsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  !snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}',
                      style: const TextStyle(color: Color(0xFF71717A))),
                );
              }

              final allMeals = (snapshot.data ?? [])
                  .where((m) => !deletedIds.value.contains(m.nutrition.id))
                  .toList();

              final mealsForSelectedDate = allMeals.where((m) {
                final mealDays = m.nutrition.day
                        ?.map((d) => d.toLowerCase().trim())
                        .toList() ??
                    [];
                return mealDays
                    .contains(dayName(selectedDate.value).toLowerCase());
              }).toList();

              final filteredMeals = selectedCategory.value == 'All'
                  ? mealsForSelectedDate
                  : mealsForSelectedDate.where((m) {
                      final type = (m.nutrition.type?.isNotEmpty == true)
                          ? m.nutrition.type!.first.toLowerCase()
                          : '';
                      return type == selectedCategory.value.toLowerCase();
                    }).toList();

              final completedCount = mealsForSelectedDate
                  .where((m) => resolveStatus(m) == MealStatus.completed)
                  .length;
              final totalCount = mealsForSelectedDate.length;

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TodoAppBar(
                      date: selectedDate.value,
                      completed: completedCount,
                      total: totalCount,
                      streak: 7, // Placeholder for streak
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TodoDateSelector(
                      initialDate: selectedDate.value,
                      onDateChanged: (date) {
                        selectedDate.value = date;
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TodoCategoryTabs(
                      onCategoryChanged: (cat) => selectedCategory.value = cat,
                    ),
                  ),
                  // const SliverToBoxAdapter(child: TodoAlertBanner()),
                  if (filteredMeals.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Text(
                            selectedCategory.value == 'All'
                                ? 'No meals planned for this day'
                                : 'No ${selectedCategory.value} meals on this day',
                            style: const TextStyle(
                                color: Color(0xFF71717A), fontSize: 14),
                          ),
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(24, 20, 24, 150),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: buildMealCard(filteredMeals[index]),
                          ),
                          childCount: filteredMeals.length,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          Positioned(
            left: 0,
            right: 60,
            bottom: 0, // leave space for FAB
            child: SafeArea(
              top: false,
              child: FutureBuilder<List<Meal>>(
                future: mealsFuture,
                builder: (context, snapshot) {
                  final allMeals = snapshot.data ?? [];

                  final mealsForSelectedDate = allMeals.where((m) {
                    final mealDays = m.nutrition.day
                            ?.map((d) => d.toLowerCase().trim())
                            .toList() ??
                        [];
                    return mealDays
                        .contains(dayName(selectedDate.value).toLowerCase());
                  }).toList();

                  final completedCount = mealsForSelectedDate
                      .where((m) => resolveStatus(m) == MealStatus.completed)
                      .length;

                  final totalCount = mealsForSelectedDate.length;

                  final progress =
                      totalCount > 0 ? completedCount / totalCount : 0;

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: TodoProgressBar(
                      key: ValueKey(progress),
                      completed: completedCount,
                      total: totalCount,
                      motivationalText: totalCount == 0
                          ? "No meals scheduled for today 🍽️"
                          : completedCount == totalCount
                              ? "All meals done! Great job today 🎉"
                              : "You're ${(progress * 100).round()}% closer to today's goal 💪",
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: TodoFAB(
        onPressed: () => context.go(RouteConstants.nutrition.path),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
