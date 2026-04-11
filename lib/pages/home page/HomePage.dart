import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intake_helper/Providers/providers.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/components/bottom_navbar.dart';
import 'package:intake_helper/components/weekly_chart.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_meal_cards.dart';
import 'package:intake_helper/pages/home%20page/widgets/hero_section_card.dart';
import 'package:intake_helper/pages/home%20page/widgets/macros_card.dart';
import 'package:intake_helper/pages/home%20page/widgets/quick_actions_button.dart';
import 'package:intake_helper/pages/home%20page/widgets/saved_meals_card.dart';
import 'package:intake_helper/pages/home%20page/widgets/schedule_meal_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:intake_helper/l10n/app_localizations.dart';

class Homepage extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.read(apiServiceProvider.notifier);
    final locale = AppLocalizations.of(context)!;

    final todoData = useState<TodoModel?>(null);
    final completedTasks = useState<List<String>>([]);
    final macros = useState<Map<String, double>>({});
    final targets = useState<Map<String, double>?>(null);
    final weeklyProtein = useState<Map<String, double>>({});

    final isLoading = useState(true);
    final error = useState<String?>(null);

    // Save targets locally
    Future<void> saveTargetsLocal(Map<String, double> targets) async {
      final prefs = await SharedPreferences.getInstance();
      final targetsJson = jsonEncode(targets);
      await prefs.setString('user_targets', targetsJson);
    }

// Load targets locally
    Future<Map<String, double>?> loadTargetsLocal() async {
      try {
        final prefs = await SharedPreferences.getInstance();
        final targetsJson = prefs.getString('user_targets');
        if (targetsJson != null) {
          final decoded = jsonDecode(targetsJson) as Map<String, dynamic>;
          return decoded.map((key, value) => MapEntry(key, value.toDouble()));
        }
      } catch (e) {
        // Handle JSON parsing errors
        debugPrint('Error loading targets: $e');
      }
      return null;
    }

    void calculateMacros(TodoModel data, List<String> completedIds) {
      double protein = 0, carbs = 0, calories = 0;

      for (final meal in data.meals) {
        if (meal.status == MealStatus.completed.name) {
          final n = meal.nutrition;
          protein += n.protein ?? 0;
          carbs += n.carbohydrates ?? 0;
          calories += n.calories ?? 0;
        }
      }

      macros.value = {
        'protein': protein,
        'carbs': carbs,
        'calories': calories,
        'fats': macros.value['fats'] ?? 0,
      };
    }

    String _getWeekKey() {
      final now = DateTime.now();
      // ISO week: Monday = start of week
      final monday = now.subtract(Duration(days: now.weekday - 1));
      return '${monday.year}-${monday.month}-${monday.day}';
    }

    Future<void> saveWeeklyProtein(Map<String, double> proteinByDay) async {
      final prefs = await SharedPreferences.getInstance();
      final weekKey = _getWeekKey();
      await prefs.setString('weekly_protein_key', weekKey);
      await prefs.setString('weekly_protein_data', jsonEncode(proteinByDay));
    }

    Future<Map<String, double>?> loadWeeklyProtein() async {
      final prefs = await SharedPreferences.getInstance();
      final savedKey = prefs.getString('weekly_protein_key');
      final currentKey = _getWeekKey();

      // If saved week != current week → reset
      if (savedKey != currentKey) {
        await prefs.remove('weekly_protein_data');
        await prefs.remove('weekly_protein_key');
        return null; // Fresh week
      }

      final data = prefs.getString('weekly_protein_data');
      if (data != null) {
        final decoded = jsonDecode(data) as Map<String, dynamic>;
        return decoded.map((k, v) => MapEntry(k, (v as num).toDouble()));
      }
      return null;
    }

    Future<void> loadAll() async {
      try {
        isLoading.value = true;
        error.value = null;

        final data = await api.getTodo();
        final completed = await SharedService.getCompletedTasks();

        todoData.value = data?.data;
        completedTasks.value = completed;

        if (data != null) {
          calculateMacros(data.data!, completed);
        }

        // Load persisted weekly protein (resets if new week)
        final savedWeekly = await loadWeeklyProtein();

        // Build this week's protein from COMPLETED meals only
        final Map<String, double> freshProteinByDay = {};
        for (final item in data?.data?.meals ?? []) {
          if (item.status != MealStatus.completed.name) continue;

          final days = item.nutrition.day ?? [];
          for (final d in days) {
            final day = d.trim();
            if (day.isEmpty) continue;
            freshProteinByDay[day] =
                (freshProteinByDay[day] ?? 0) + (item.nutrition.protein ?? 0);
          }
        }

        weeklyProtein.value = freshProteinByDay;
        await saveWeeklyProtein(freshProteinByDay);
      } catch (e) {
        error.value = locale.homePageFailedToLoad;
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> getProfileDetails() async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        await ref.read(apiServiceProvider.notifier).getProfile(token);
      }
    }

    useEffect(() {
      Future.microtask(() async {
        await loadAll();
        await getProfileDetails();

        // Load saved targets after initial data
        final savedTargets = await loadTargetsLocal();
        if (savedTargets != null) {
          targets.value = savedTargets;
        }
      });
      return null;
    }, []);
    final profileDetailState = ref.watch(apiServiceProvider);
    final profile = profileDetailState.value?.profileData;

    final chartData = () {
      const orderedDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return orderedDays
          .where((d) => weeklyProtein.value.containsKey(d))
          .map((d) => {'day': d, 'protein': weeklyProtein.value[d]!})
          .toList();
    }();

    final proteinPercent =
        (macros.value['protein'] ?? 0) / (targets.value?['protein'] ?? 1) * 100;

    loadTargetsLocal();

    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : error.value != null
              ? Center(
                  child: Text(error.value!,
                      style: const TextStyle(color: Colors.red)))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          buildHeroSection(
                              context,
                              macros.value,
                              targets.value ?? {},
                              proteinPercent,
                              profile?.fullName,
                              ref),
                          Positioned(
                            bottom: -250,
                            left: 0,
                            right: 0,
                            child: MacrosCard(
                              macros: macros.value,
                              targets: targets.value,
                              onTargetSaved: (newTargets) {
                                targets.value = newTargets;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 280),
                      buildQuickActions(context, targets.value, (newTargets) {
                        targets.value = newTargets;
                        saveTargetsLocal(newTargets);
                      }),
                      const SizedBox(height: 24),
                      buildScheduledMeals(
                          context, todoData.value, completedTasks.value),
                      const SizedBox(height: 24),
                      buildSavedMeals(context, ref),
                      const SizedBox(height: 24),
                      buildWeeklyChart(ref: ref, chartData: chartData),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SharedService {
  static Future<List<String>> getCompletedTasks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('completed_tasks') ?? [];
  }
}
