import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/Providers/providers.dart';
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
        if (n != null && completed.contains(n.id)) {
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

        todoData.value = data;
        completedTasks.value = completed;

        if (data != null) {
          calculateMacros(data, completed); // ✅ UPDATE STATE
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
        leading: const SizedBox.shrink(),
        backgroundColor: Colors.black,
        title: const Text("Gym Intake Tracker",
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.orange),
            onPressed: loadAll,
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.orange),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),

      // ---------------- FAB MENU ----------------
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        tooltip: "Ask AI to generate a meal plan",
        child: PopupMenuButton<String>(
          color: Colors.black,
          icon: const Icon(Icons.question_answer, color: Colors.white),
          onSelected: (value) {},
          itemBuilder: (BuildContext context) => [
            // in progress :-
            // const PopupMenuItem<String>(
            //   value: 'Generate Meal Plan',
            //   child: Text('Generate Meal Plan',
            //       style: TextStyle(color: Colors.white)),
            // ),
            PopupMenuItem<String>(
              value: 'Search Meal Plans',
              child: GestureDetector(
                child: const Text('Search Meal Plans',
                    style: TextStyle(color: Colors.white)),
                onTap: () => context.push('/nutrition'),
              ),
            ),
            PopupMenuItem<String>(
              value: 'Settings',
              child:
                  const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () => {context.push(RouteConstants.settings.path)},
            ),
            PopupMenuItem<String>(
              value: 'Logout',
              child:
                  const Text('LogOut', style: TextStyle(color: Colors.white)),
              onTap: () => {
                SharedPreferences.getInstance().then((prefs) => prefs.clear()),
                context.push('/login'),
                // SharedPreferences.getInstance().then((prefs) => prefs.clear()),
              },
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
                              gradientColors,
                            ),
                            _statCard(
                              "Completed Meals",
                              "${completedTasks.value.length}/${todoData.value!.meals.length}",
                              [Colors.green, Colors.teal],
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
                          chartRadius: MediaQuery.of(context).size.width / 2.5,
                          chartType: ChartType.ring,
                          chartLegendSpacing: 32,
                          colorList: const [
                            Colors.redAccent,
                            Colors.amber,
                            Colors.lightBlueAccent,
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
                            return Card(
                              color: Colors.black87,
                              child: ListTile(
                                  title: Text(meal.dishName ?? '',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  subtitle: Text(
                                    "Calories: ${meal.calories ?? 0}, Protein: ${meal.protein ?? 0}g",
                                    style:
                                        const TextStyle(color: Colors.white70),
                                  ),
                                  onTap: () => {
                                        if (meal.id != null)
                                          {
                                            context.pushNamed(
                                              RouteConstants.mealDetails.name,
                                              pathParameters: {'id': meal.id!},
                                            )
                                          }
                                      }),
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
    String value,
    List<Color> colors, {
    VoidCallback? onTap,
  }) {
    final card = Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    return onTap == null
        ? card
        : GestureDetector(
            onTap: onTap,
            child: card,
          );
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
