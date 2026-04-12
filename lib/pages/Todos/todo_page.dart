import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/meal_notifications_provider.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intake_helper/components/dialogs/streak_celebration_dialog.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class TodoPage extends HookConsumerWidget {
  const TodoPage({super.key});

  // ─── Week key helper ────────────────────────────────────────────────────────
  static String _currentWeekKey() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return '${monday.year}-${monday.month.toString().padLeft(2, '0')}-${monday.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = AppLocalizations.of(context)!;

    final selectedCategory = useState(locale.todoPageAll);
    final selectedDate = useState(DateTime.now());
    final refreshKey = useState(0);
    final deletedIds = useState<Set<String>>({});
    final isResetting = useState(false); // guard to avoid double-reset

    final todosState = ref.read(appProvider.notifier);
    final streakState = ref.watch(appProvider);

    // ─── Week-reset: runs once on mount ─────────────────────────────────────
    useEffect(() {
      Future.microtask(() async {
        if (isResetting.value) return;

        final prefs = await SharedPreferences.getInstance();
        final savedWeek = prefs.getString('todo_week_key') ?? '';
        final currentWeek = _currentWeekKey();

        if (savedWeek != currentWeek) {
          isResetting.value = true;
          try {
            // Delete ALL previous-week todos from backend
            await todosState.resetTodo();

            // Persist the new week key ONLY after successful reset
            await prefs.setString('todo_week_key', currentWeek);

            // Also clear any weekly chart / protein cache from home page
            await prefs.remove('weekly_protein_data');
            await prefs.remove('weekly_protein_key');
          } catch (e) {
            debugPrint('Week reset failed: $e');
            // Don't save the new week key — will retry next time
          } finally {
            isResetting.value = false;
          }
        }

        // Trigger a fresh fetch after reset (or on normal load)
        refreshKey.value++;
      });
      return null;
    }, []); // ← runs only once on mount

    // ─── Meals future: only runs after reset completes ───────────────────────
    final mealsFuture = useMemoized<Future<List<Meal>>>(
      () async {
        // If a reset is in progress, wait for it
        while (isResetting.value) {
          await Future.delayed(const Duration(milliseconds: 100));
        }
        final value = await todosState.getTodo();
        return value?.data?.meals ?? <Meal>[];
      },
      [refreshKey.value],
    );

    // ─── Actions ─────────────────────────────────────────────────────────────
    Future<void> markComplete(String mealId, DateTime date) async {
      await todosState.updateMealStatus(mealId, 'completed').then((_) async {
        await todosState.updateStreak(todosCompleted: 1);
        final notificationService = ref.read(mealNotificationProvider.notifier);
        await notificationService.updateTaskCompleted();
      });
      refreshKey.value++;
    }

    Future<void> getStreak() async {
      await todosState.getStreak();
      refreshKey.value++;
    }

    Future<void> deleteMeal(String mealId) async {
      deletedIds.value = {...deletedIds.value, mealId};
      await todosState.deleteTodoItem(mealId);
      refreshKey.value++;
    }

    MealStatus resolveStatus(Meal meal) => mealStatusFromString(meal.status);

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

    useEffect(() {
      Future.microtask(() => unawaited(getStreak()));
      return null;
    }, []);

    // ─── Streak celebration ──────────────────────────────────────────────────
    final currentStreak = streakState.value?.streak?.data.currentStreak ?? 0;

    useEffect(() {
      if (currentStreak > 0) {
        Future.microtask(() async {
          final prefs = await SharedPreferences.getInstance();
          final savedStreak = prefs.getInt('saved_streak') ?? 0;
          final avatar = prefs.getString('avatar');

          if (currentStreak > savedStreak) {
            await prefs.setInt('saved_streak', currentStreak);
            if (currentStreak == 1 || currentStreak == 7) {
              if (context.mounted) {
                showStreakCelebrationDialog(
                  context,
                  streakCount: currentStreak,
                  avatar: avatar ?? 'male1',
                );
              }
            }
          }
        });
      }
      return null;
    }, [currentStreak]);

    // ─── UI ──────────────────────────────────────────────────────────────────
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Show spinner while resetting to avoid showing stale data
          if (isResetting.value)
            const Center(child: CircularProgressIndicator())
          else
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
                    child: Text(
                      locale.todoPageError(snapshot.error.toString()),
                      style: const TextStyle(color: Color(0xFF71717A)),
                    ),
                  );
                }

                final allMeals = (snapshot.data ?? [])
                    .where((m) => !deletedIds.value.contains(m.nutrition.id))
                    .toList();

                // Filter meals for the selected day
                final mealsForSelectedDate = allMeals.where((m) {
                  final mealDays = m.nutrition.day
                          ?.expand((d) => d.split(','))
                          .map((d) => d.trim().toLowerCase())
                          .toList() ??
                      [];
                  return mealDays
                      .contains(dayName(selectedDate.value).toLowerCase());
                }).toList();

                // Apply category filter on top
                final filteredMeals = mealsForSelectedDate.where((m) {
                  if (selectedCategory.value == locale.todoPageAll) return true;

                  final allTypes = (m.nutrition.type ?? [])
                      .map((t) => t.trim().toLowerCase())
                      .toList();

                  return allTypes
                      .contains(selectedCategory.value.toLowerCase());
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
                        streak:
                            streakState.value?.streak?.data.currentStreak ?? 0,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: TodoDateSelector(
                        initialDate: selectedDate.value,
                        onDateChanged: (date) => selectedDate.value = date,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: TodoCategoryTabs(
                        onCategoryChanged: (cat) =>
                            selectedCategory.value = cat,
                      ),
                    ),
                    if (filteredMeals.isEmpty)
                      SliverFillRemaining(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              selectedCategory.value == locale.todoPageAll
                                  ? locale.todoPageNoMealsPlanned
                                  : locale.todoPageNoMealsInCategory(
                                      selectedCategory.value),
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

          // Progress bar always at bottom
          Positioned(
            left: 0,
            right: 60,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: FutureBuilder<List<Meal>>(
                future: mealsFuture,
                builder: (context, snapshot) {
                  final allMeals = snapshot.data ?? [];
                  final mealsForSelectedDate = allMeals.where((m) {
                    final mealDays = m.nutrition.day
                            ?.expand((d) => d.split(','))
                            .map((d) => d.trim().toLowerCase())
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
                          ? locale.todoPageNoMealsScheduled
                          : completedCount == totalCount
                              ? locale.todoPageAllMealsDone
                              : locale.todoPageProgressMessage(
                                  (progress * 100).round()),
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
