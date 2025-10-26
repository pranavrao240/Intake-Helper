import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:intake_helper/pages/todoListScreen.dart';
import 'package:intake_helper/utility/notification.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pie_chart/pie_chart.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with RouteAware {
  final api = ApiService();
  var gradienColors = [Colors.red, Colors.orange];

  String _searchQuery = "";
  int total_meals = 0;
  TodoModel? todoData;
  List<String> completedTasks = [];

  List<Nutrition> _filterData(List<Nutrition> data) {
    return data.where((item) {
      final types = item.type ?? [];
      return types.contains(_searchQuery);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _loadTodosAndCompleted();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteObserver<ModalRoute<void>>().subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    RouteObserver<ModalRoute<void>>().unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    _loadTodosAndCompleted();
  }

  Future<void> _loadTodosAndCompleted() async {
    final data = await api.getTodo();
    final completed = await SharedService.getCompletedTasks();

    setState(() {
      todoData = data;
      total_meals = data?.meals.length ?? 0;
      completedTasks = completed;
    });
  }

  Future<Map<String, double>> calculateCompletedMacros() async {
    final data = await api.getTodo();
    final completed = await SharedService.getCompletedTasks();

    double totalProtein = 0;
    double totalCarbs = 0;
    double totalCalories = 0;

    for (final meal in data?.meals ?? []) {
      final nutrition = meal.nutrition;
      if (nutrition != null && completed.contains(nutrition.id)) {
        totalProtein += nutrition.protein ?? 0;
        totalCarbs += nutrition.carbohydrates ?? 0;
        totalCalories += nutrition.calories ?? 0;
      }
    }

    return {
      'protein': totalProtein,
      'carbs': totalCarbs,
      'calories': totalCalories,
    };
  }

  @override
  Widget build(BuildContext context) {
    String image = "lib/assets/images/baki.jpg";

    final allMeals = todoData?.meals
            .map((e) => e.nutrition)
            .where((n) => n.dishName != null && n.dishName!.isNotEmpty)
            .toList() ??
        [];

    final filtered = _filterData(allMeals);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Gym Intake Tracker",
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.orange),
            onPressed: _loadTodosAndCompleted,
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.orange),
            onPressed: () => Navigator.of(context).pushNamed('/settings'),
          )
        ],
      ),
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
          onSelected: (value) {
            print('Selected: $value');
          },
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
                onTap: () => Navigator.of(context).pushNamed('/nutrition'),
              ),
            ),
            PopupMenuItem<String>(
              value: 'Settings',
              child:
                  const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.of(context).pushNamed('/settings'),
            ),
            PopupMenuItem<String>(
              value: 'Logout',
              child:
                  const Text('LogOut', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.of(context).pushNamed('/login'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: todoData == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     // Request notification permission
                      //     final status = await Permission.notification.status;
                      //     if (status.isDenied) {
                      //       final result = await showDialog<bool>(
                      //         context: context,
                      //         builder: (context) => AlertDialog(
                      //           title: const Text('Notifications'),
                      //           content: const Text(
                      //               'This app would like to send you notifications. Would you like to enable them?'),
                      //           actions: [
                      //             TextButton(
                      //               onPressed: () =>
                      //                   Navigator.pop(context, false),
                      //               child: const Text('Not Now'),
                      //             ),
                      //             TextButton(
                      //               onPressed: () =>
                      //                   Navigator.pop(context, true),
                      //               child: const Text('Allow'),
                      //             ),
                      //           ],
                      //         ),
                      //       );

                      //       if (result == true) {
                      //         await Permission.notification.request();
                      //       } else {
                      //         if (context.mounted) {
                      //           ScaffoldMessenger.of(context).showSnackBar(
                      //             const SnackBar(
                      //                 content:
                      //                     Text('Notifications are disabled')),
                      //           );
                      //         }
                      //         return;
                      //       }
                      //     }

                      //     if (await Permission.notification.isGranted) {
                      //       CustomNotification()
                      //           .scheduleNotification("title", "body", 5);
                      //     }
                      //   },
                      //   child: const Text('Show Notification'),
                      // ),

                      ElevatedButton(
                          onPressed: () async {
                            await CustomNotification().showScheduleNotification(
                                1, "Drink Water", "Stay hydrated 💧", 22, 31);
                          },
                          child: Text("Notify")),

                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('lib/assets/images/baki.jpg'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 160,
                            height: 90,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: gradienColors),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: gradienColors.last.withOpacity(0.4),
                                  blurRadius: 6,
                                  offset: const Offset(2, 4),
                                ),
                              ],
                            ),
                            child: FutureBuilder<Map<String, double>>(
                              future: calculateCompletedMacros(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return const Text('Error loading protein',
                                      style: TextStyle(color: Colors.white));
                                } else {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Completed Protein:',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16)),
                                        const SizedBox(height: 6),
                                        Text(
                                            snapshot.data!['protein']!
                                                    .toStringAsFixed(2) ??
                                                "0.0",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          _statCard(
                              "Completed Meals",
                              "${completedTasks.length}/$total_meals",
                              [Colors.green, Colors.teal],
                              '/todo-page'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _sectionTitle("Your Today's Progress"),
                      FutureBuilder<Map<String, double>>(
                        future: calculateCompletedMacros(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return const Text('Error loading protein',
                                style: TextStyle(color: Colors.white));
                          } else {
                            final protein = snapshot.data?['protein'] ?? 0.0;
                            final carbs = snapshot.data?['carbs'] ?? 0.0;
                            final calories = snapshot.data?['calories'] ?? 0.0;
                            final dataMap = {
                              "Protein": protein,
                              "Carbs": carbs,
                              "Calories": calories,
                            };
                            return PieChart(
                              dataMap: dataMap,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 2.5,
                              chartType: ChartType.ring,
                              colorList: [
                                Colors.redAccent,
                                Colors.amber,
                                Colors.lightBlueAccent
                              ],
                              chartLegendSpacing: 32,
                              legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.bottom,
                                legendTextStyle: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      _sectionTitle("Today's Meals"),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            DropdownMenu(
                              textStyle: const TextStyle(color: Colors.white),
                              menuStyle: MenuStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(221, 244, 241, 241)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(
                                    value: "Breakfast", label: "Breakfast"),
                                DropdownMenuEntry(
                                    value: "Lunch", label: "Lunch"),
                                DropdownMenuEntry(
                                    value: "Dinner", label: "Dinner"),
                              ],
                              onSelected: (value) {
                                setState(() {
                                  _searchQuery = value ?? "";
                                });
                              },
                            ),
                            const SizedBox(height: 10),
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
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    subtitle: Text(
                                      "Calories: ${meal.calories ?? 0}, Protein: ${meal.protein ?? 0}g",
                                      style: const TextStyle(
                                          color: Colors.white70),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () async {
                                        final success =
                                            await api.deleteTodoItem(
                                                meal.nutritionId ?? "");
                                        if (success == true) {
                                          await _loadTodosAndCompleted();
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    "Failed to delete item.")),
                                          );
                                        }
                                      },
                                    ),
                                    onTap: () => Navigator.of(context)
                                        .pushNamed("/meal-details",
                                            arguments: {'_id': meal.id}),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _statCard(
      String title, String value, List<Color> gradientColors, String route) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
        width: 160,
        height: 90,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 6),
              Text(value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
