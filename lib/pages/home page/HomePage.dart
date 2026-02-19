import 'package:flutter/material.dart';
import 'package:intake_helper/Providers/providers.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/components/bottom_navbar.dart';
import 'package:intake_helper/components/videoPlayer_FAB.dart';
import 'package:intake_helper/components/weekly_chart.dart';
import 'package:intake_helper/models/todo_model.dart';
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

    // ---------------- STATES ----------------
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

    // ---------------- HELPERS ----------------
    void calculateMacros(TodoModel data, List<String> completed) {
      double protein = 0, carbs = 0, calories = 0;

      for (final meal in data.meals) {
        final n = meal.nutrition;
        if (completed.contains(n.id)) {
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

    // ---------------- INIT ----------------
    useEffect(() {
      Future.microtask(() async {
        await loadAll();
        await getProfileDetails();
      });
      return null;
    }, []);

    final profileDetailState = ref.watch(appProvider);
    final profile = profileDetailState.value?.profileData;

    final chartData = todoData.value?.meals.expand((item) {
      final days = (item.nutrition.day?.first ?? '').split(',');

      return days.map((d) => {
            'day': d.trim(),
            'protein': item.nutrition.protein ?? 0,
          });
    }).toList();

    // final chartData2 =

    final proteinPercent =
        (macros.value['protein'] ?? 0) / (targets.value['protein'] ?? 1) * 100;

    // ---------------- UI ----------------
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
                      // ---------------- HERO SECTION ----------------
                      buildHeroSection(context, macros.value, targets.value,
                          proteinPercent, profile),

                      const SizedBox(height: 100),

                      // ---------------- MACROS CARD ----------------
                      buildMacrosCard(macros.value, targets.value),

                      const SizedBox(height: 24),

                      // ---------------- QUICK ACTIONS ----------------
                      buildQuickActions(context),

                      const SizedBox(height: 24),

                      // ---------------- SCHEDULED MEALS ----------------
                      buildScheduledMeals(
                          context, todoData.value, completedTasks.value),

                      const SizedBox(height: 24),

                      // ---------------- SAVED MEALS ----------------
                      buildSavedMeals(context),

                      const SizedBox(height: 24),

                      // ---------------- WEEKLY CHART ----------------
                      buildWeeklyChart(chartData: chartData ?? []),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
      bottomNavigationBar: BottomNavbar(),
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        color: Colors.transparent,
        width: 120,
        height: 120,
        child: VideoPlayerFAB(),
      ),
    );
  }
}

// ---------------- CUSTOM PAINTER FOR CIRCULAR PROGRESS ----------------
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

// ---------------- SHARED SERVICE ----------------
class SharedService {
  static Future<List<String>> getCompletedTasks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('completed_tasks') ?? [];
  }
}
