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
import 'package:intl/intl.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState('All');
    final selectedDate = useState<DateTime>(DateTime.now());

    final refreshKey = useState(0);

    final deletedIds = useState<Set<String>>({});

    final todosState = ref.read(appProvider.notifier);

    final mealsFuture = useMemoized<Future<List<Meal>>>(
      () =>
          todosState.getTodo().then((value) => value?.data?.meals ?? <Meal>[]),
      [refreshKey.value],
    );

    Future<void> markComplete(String mealId, DateTime date) async {
      selectedDate.value = date;
      await todosState.updateMealStatus(mealId, 'completed');
      if (context.mounted) refreshKey.value++;
    }

    String dayName(DateTime date) {
      const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return days[date.weekday - 1];
    }

    Future<void> deleteMeal(String mealId) async {
      deletedIds.value = {...deletedIds.value, mealId};
      await todosState.deleteTodoItem(mealId);
      if (context.mounted) {
        refreshKey.value++;
      }
    }

    MealStatus resolveStatus(Meal meal) {
      return mealStatusFromString(meal.status);
    }

    Widget buildMealCard(MealCardData cardData, String mealId) {
      void openDialog() {
        showMealActionDialog(
          context: context,
          meal: cardData,
          onComplete: (date) => markComplete(mealId, date),
          onDelete: () => deleteMeal(mealId),
        );
      }

      switch (cardData.status) {
        case MealStatus.completed:
          return CompletedMealCard(data: cardData);
        case MealStatus.active:
          return ActiveMealCard(
            data: cardData.copyWith(onTap: openDialog),
            onTap: openDialog,
          );
        case MealStatus.missed:
          return MissedMealCard(data: cardData);
        case MealStatus.upcoming:
          return UpcomingMealCard(
            data: cardData.copyWith(onTap: openDialog),
          );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const TodoAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodoDateSelector(
                    onDateChanged: (date) {
                      selectedDate.value = date;
                    },
                  ),
                  TodoCategoryTabs(
                    onCategoryChanged: (cat) => selectedCategory.value = cat,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: FutureBuilder<List<Meal>>(
                      key: ValueKey(refreshKey.value),
                      future: mealsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}',
                                style:
                                    const TextStyle(color: Color(0xFF71717A))),
                          );
                        }

                        final meals = (snapshot.data ?? [])
                            .where((m) =>
                                !deletedIds.value.contains(m.nutrition.id))
                            .toList();

                        final dateMealsByDay = meals.where((m) {
                          final mealDays = m.nutrition.day
                                  ?.map((d) => d.toLowerCase().trim())
                                  .toList() ??
                              [];
                          return mealDays.contains(
                              dayName(selectedDate.value).toLowerCase());
                        }).toList();

                        final filteredMeals = selectedCategory.value == 'All'
                            ? dateMealsByDay
                            : dateMealsByDay.where((m) {
                                final type =
                                    (m.nutrition.type?.isNotEmpty == true)
                                        ? m.nutrition.type!.first.toLowerCase()
                                        : '';
                                return type ==
                                    selectedCategory.value.toLowerCase();
                              }).toList();

                        if (filteredMeals.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text(
                                selectedCategory.value == 'All'
                                    ? 'No meals planned for this day'
                                    : 'No ${selectedCategory.value} meals on this day',
                                style: const TextStyle(
                                    color: Color(0xFF71717A), fontSize: 14),
                              ),
                            ),
                          );
                        }

                        return Column(
                          children: filteredMeals.map((meal) {
                            final id = meal.nutrition.id ?? '';
                            final status = resolveStatus(meal);
                            final cardData = MealCardData(
                              title: meal.nutrition.dishName ?? '',
                              time: meal.nutrition.time?.toString() ?? '',
                              status: status,
                              isChecked: status == MealStatus.completed,
                            );
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: buildMealCard(cardData, id),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          FutureBuilder(
            key: ValueKey('progress_${refreshKey.value}_${selectedDate.value}'),
            future: mealsFuture,
            builder: (context, snapshot) {
              final allMeals = snapshot.data ?? [];

              final visible = allMeals
                  .where((m) => !deletedIds.value.contains(m.nutrition.id))
                  .where((m) {
                final mealDays = m.nutrition.day
                        ?.map((d) => d.toLowerCase().trim())
                        .toList() ??
                    [];
                return mealDays
                    .contains(dayName(selectedDate.value).toLowerCase());
              }).toList();

              final completed = visible
                  .where((m) => resolveStatus(m) == MealStatus.completed)
                  .length;
              final total = visible.length;

              return TodoProgressBar(
                completed: completed,
                total: total,
                motivationalText: total == 0 || completed == total
                    ? "All meals done! Great job today 🎉"
                    : "You're ${((completed / total) * 100).round()}% closer to today's goal 💪",
              );
            },
          ),
        ],
      ),
      floatingActionButton: TodoFAB(
        onPressed: () => context.go(RouteConstants.nutrition.path),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
