import 'package:flutter/material.dart';
import 'package:intake_helper/Providers/providers.dart';
import 'package:intake_helper/Providers/settings_providers.dart';
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

class Homepage extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.read(apiServiceProvider.notifier);
    final unitsConversion = ref.read(weightUnitProvider);

    final todoData = useState<TodoModel?>(null);
    final completedTasks = useState<List<String>>([]);
    final macros = useState<Map<String, double>>({});
    final targets = useState<Map<String, double>>({});
    targets.value = {
      'protein': 150,
      'calories': 2200,
      'carbs': 250,
      'fats': 70,
    };

    final isLoading = useState(true);
    final error = useState<String?>(null);

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

      print("[Macros] Macros: ${macros.value}");
    }

    Future<void> loadAll() async {
      try {
        isLoading.value = true;
        error.value = null;

        final data = await api.getTodo();

        final completed = await SharedService.getCompletedTasks();

        todoData.value = data?.data;
        completedTasks.value = completed;
        print('Completed tasks: $completed');

        if (data != null) {
          calculateMacros(data.data!, completed);
        }
      } catch (e) {
        print("Error: $e");
        error.value = "Failed to load data";
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> getProfileDetails() async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        await ref.read(appProvider.notifier).getProfile(token);
      }
    }

    useEffect(() {
      Future.microtask(() async {
        await loadAll();
        await getProfileDetails();
      });
      return null;
    }, []);

    final profileDetailState = ref.watch(appProvider);
    final profile = profileDetailState.value?.profileData;

    final chartData = () {
      final Map<String, double> proteinByDay = {};

      for (final item in todoData.value?.meals ?? []) {
        final days = item.nutrition.day ?? [];
        for (final d in days) {
          final day = d.trim();
          if (day.isEmpty) continue;
          proteinByDay[day] =
              (proteinByDay[day] ?? 0) + (item.nutrition.protein ?? 0);
        }
      }

      const orderedDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      return orderedDays
          .where((d) => proteinByDay.containsKey(d))
          .map((d) => {'day': d, 'protein': proteinByDay[d]!})
          .toList();
    }();

    final proteinPercent =
        (macros.value['protein'] ?? 0) / (targets.value['protein'] ?? 1) * 100;

    return Scaffold(
      backgroundColor: Colors.black,
      // In your Homepage build() method, replace the SingleChildScrollView body with this:

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
                          buildHeroSection(context, macros.value, targets.value,
                              proteinPercent, profile, ref),
                          Positioned(
                            bottom: -250,
                            left: 0,
                            right: 0,
                            child: buildMacrosCard(
                                ref, macros.value, targets.value),
                          ),
                        ],
                      ),
                      const SizedBox(height: 280),
                      buildQuickActions(context),
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
