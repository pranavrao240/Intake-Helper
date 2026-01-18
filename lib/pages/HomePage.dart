import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:intake_helper/pages/todoListScreen.dart';
import 'package:intake_helper/router.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.read(apiServiceProvider.notifier);

    final gradientColors = [Colors.red, Colors.orange];

    // ---------------- STATES ----------------
    final searchQuery = useState<String>("");
    final todoData = useState<TodoModel?>(null);
    final completedTasks = useState<List<String>>([]);
    final macros = useState<Map<String, double>>({
      'protein': 0,
      'carbs': 0,
      'calories': 0,
    });
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

        if (data != null) {
          calculateMacros(data.data!, completed); // ✅ UPDATE STATE
        }
      } catch (e) {
        error.value = "Failed to load data";
      } finally {
        isLoading.value = false;
      }
    }

    List<Nutrition> _filterData(List<Nutrition> data) {
      return data.where((item) {
        final types = item.type ?? [];
        return types.contains(searchQuery.value);
      }).toList();
    }

    // ---------------- INIT ----------------
    useEffect(() {
      Future.microtask(() => loadAll());

      return null;
    }, []);

    final allMeals = todoData.value?.meals
            .map((e) => e.nutrition)
            .where((n) => n.dishName != null && n.dishName!.isNotEmpty)
            .toList() ??
        [];
    final filtered = _filterData(allMeals);

    // ---------------- UI ----------------
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: const Text(
          "Gym Intake Tracker",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFF00FFAA)),
            onPressed: loadAll,
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF00FFAA)),
            onPressed: () => context.push(RouteConstants.settings.path),
          ),
        ],
      ),

      // ---------------- FAB MENU ----------------
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFF00FFAA), Color(0xFF00C896)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: PopupMenuButton<String>(
          tooltip: "Ask AI to generate a meal plan",
          color: const Color(0xFF1A1A1A),
          icon: const Icon(Icons.question_answer, color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          onSelected: (value) async {
            switch (value) {
              case 'AI':
                await context.push(RouteConstants.aiMealPlanner.path);
                break;
              case 'Nutrition':
                await context.push(RouteConstants.nutrition.path);
                break;
              case 'Settings':
                context.pushReplacement(RouteConstants.settings.path);
                break;
              case 'Logout':
                final pref = await SharedPreferences.getInstance();
                pref.remove('token');
                await pref.clear();
                context.go('/login');
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'AI',
              child: _FabMenuItem(
                icon: Icons.auto_awesome,
                text: 'AI Meal Planner',
              ),
            ),
            PopupMenuItem(
              value: 'Nutrition',
              child: _FabMenuItem(
                icon: Icons.search,
                text: 'Search Meal Plans',
              ),
            ),
            PopupMenuItem(
              value: 'Settings',
              child: _FabMenuItem(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ),
            PopupMenuItem(
              value: 'Logout',
              child: _FabMenuItem(
                icon: Icons.logout,
                text: 'Logout',
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : error.value != null
                ? Center(
                    child: Text(error.value!,
                        style: const TextStyle(color: Colors.red)))
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('lib/assets/images/baki.jpg'),
                        ),

                        const SizedBox(height: 20),

                        // ---------------- STATS ----------------
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _statCard(
                              "Completed Protein",
                              macros.value['protein']!.toStringAsFixed(2),
                            ),
                            _statCard(
                              "Completed Meals",
                              "${completedTasks.value.length}/${todoData.value?.meals.length ?? 0}",
                              onTap: () => context.push('/todo'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),
                        _sectionTitle("Your Today's Progress"),

                        // ---------------- PIE CHART ----------------
                        PieChart(
                          dataMap: {
                            "Protein": macros.value['protein']!,
                            "Carbs": macros.value['carbs']!,
                            "Calories": macros.value['calories']!,
                          },
                          chartRadius: MediaQuery.of(context).size.width / 2.6,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 18,
                          colorList: const [
                            Color(0xFF00FFAA),
                            Color(0xFFFFC107),
                            Color(0xFF03A9F4),
                          ],
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.bottom,
                            legendTextStyle: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 30),
                        _sectionTitle("Today's Meals"),

                        // ---------------- DROPDOWN (BOTTOM ONLY) ----------------
                        DropdownButtonFormField<String>(
                          dropdownColor: Colors.black,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF1E1E1E),
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text("Select Category",
                              style: TextStyle(color: Colors.white)),
                          items: const [
                            DropdownMenuItem(
                                value: "Breakfast",
                                child: Text(
                                  "Breakfast",
                                  style: TextStyle(color: Colors.white),
                                )),
                            DropdownMenuItem(
                                value: "Lunch",
                                child: Text(
                                  "Lunch",
                                  style: TextStyle(color: Colors.white),
                                )),
                            DropdownMenuItem(
                                value: "Dinner",
                                child: Text(
                                  "Dinner",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                          onChanged: (value) => searchQuery.value = value ?? "",
                        ),

                        const SizedBox(height: 10),

                        // ---------------- MEALS LIST ----------------
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final meal = filtered[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF2D2D2D),
                                    Color(0xFF1A1A1A)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  meal.dishName ?? '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "Calories: ${meal.calories ?? 0} • Protein: ${meal.protein ?? 0}g",
                                  style: const TextStyle(
                                      color: Color(0xFF00FFAA), fontSize: 13),
                                ),
                                trailing: const Icon(Icons.fitness_center,
                                    color: Colors.white),
                                onTap: () {
                                  if (meal.id != null) {
                                    context.pushNamed(
                                      RouteConstants.mealDetails.name,
                                      pathParameters: {'id': meal.id!},
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

// ---------------- WIDGETS ----------------
  Widget _statCard(
    String title,
    String value, {
    VoidCallback? onTap,
  }) {
    final card = Container(
      width: 160,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF00FFAA),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    return onTap == null ? card : GestureDetector(onTap: onTap, child: card);
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}

class _FabMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FabMenuItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF00FFAA), size: 20),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
