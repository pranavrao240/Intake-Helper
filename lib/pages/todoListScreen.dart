import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/utility/notification.dart';
import 'package:intake_helper/widgets/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<void> saveCompletedTasks(List<String> ids) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('completed_tasks', ids);
    } catch (e) {
      debugPrint('Error saving completed tasks: $e');
    }
  }

  static Future<List<String>> getCompletedTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList('completed_tasks') ?? [];
    } catch (e) {
      debugPrint('Error getting completed tasks: $e');
      return [];
    }
  }

  static Future<void> clearCompletedTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('completed_tasks');
    } catch (e) {
      debugPrint('Error clearing completed tasks: $e');
    }
  }
}

Future<void> resetTodo(WidgetRef ref) async {
  final apiService = ref.watch(apiServiceProvider.notifier);
  await apiService.resetTodo();
}

void setNotification(var item, var index) async {
  final rawTime = item.time?.toString().replaceAll(RegExp(r'[\[\]\s]'), '');
  final randomId = Random().nextInt(100);
  if (rawTime != null && rawTime.contains(":")) {
    final parts = rawTime.split(":");
    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    print(
        "For Dish-${item.dishName} Notification time is  -> hour: $hour, minute: $minute");

    if (hour != null && minute != null) {
      await CustomNotification().showScheduleNotification(
        randomId,
        "🍽️ ${item.dishName}",
        "Time to eat your scheduled meal!",
        hour,
        minute,
      );
    }
  }
}

class TodolistScreen extends ConsumerStatefulWidget {
  const TodolistScreen({super.key});

  @override
  ConsumerState<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends ConsumerState<TodolistScreen> {
  String _searchQuery = "";
  List<bool> isCheckedList = [];
  List<String> completedIds = [];

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await _loadCompletedTasks();
    } catch (e) {
      debugPrint('Error initializing todo screen: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load tasks')),
        );
      }
    } finally {
      if (mounted) {}
    }
  }

  Future<void> _loadCompletedTasks() async {
    completedIds = await SharedService.getCompletedTasks();
    setState(() {});
  }

  List<Nutrition> _filterData(List<Nutrition> data) {
    if (_searchQuery.isEmpty) return data;
    return data
        .where((item) =>
            item.dishName?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
            false)
        .toList();
  }

  Future<void> scheduleAllNotifications(List<Nutrition> data) async {
    for (int i = 0; i < data.length; i++) {
      setNotification(data[i], i);
    }
  }

  @override
  Widget build(BuildContext context) {
    final api = ref.read(apiServiceProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: customAppbar(
        context,
        title: "Todo List",
        onBack: () => context.pushReplacement('/home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<TodoModel?>(
              future: api.getTodo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.meals.isEmpty) {
                  return const Center(child: Text("No nutrition data found."));
                } else {
                  final nutritions = snapshot.data!.meals
                      .map((meal) => meal.nutrition)
                      .where(
                          (n) => n.dishName != null && n.dishName!.isNotEmpty)
                      .toList();

                  final filteredData = _filterData(nutritions);

                  if (isCheckedList.length != filteredData.length) {
                    isCheckedList =
                        List<bool>.filled(filteredData.length, false);
                  }

                  if (filteredData.isEmpty) {
                    return const Center(child: Text("No matching results."));
                  }

                  return ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final item = filteredData[index];

                      final isCompleted =
                          completedIds.contains(item.nutritionId);

                      return Card(
                        color: isCompleted ? Colors.grey[300] : Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: ListTile(
                          enabled: !isCompleted,
                          title: Text(
                            item.dishName ?? '',
                            style: TextStyle(
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: isCompleted ? Colors.grey : Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            "Calories: ${item.calories ?? 0}, Protein: ${item.protein ?? 0}\nTime: ${item.time ?? 'N/A'}",
                            style: TextStyle(
                              color: isCompleted ? Colors.grey : Colors.black54,
                            ),
                          ),
                          leading: Checkbox(
                            value: isCheckedList[index],
                            onChanged: isCompleted
                                ? null
                                : (bool? value) {
                                    setState(() {
                                      isCheckedList[index] = value ?? false;
                                    });
                                  },
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: isCompleted
                                ? null
                                : () {
                                    api
                                        .deleteTodoItem(item.nutritionId ?? "")
                                        .then((success) {
                                      if (success == true) {
                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  "Item deleted successfully!")),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  "Failed to delete item.")),
                                        );
                                      }
                                    });
                                  },
                          ),
                          onTap: isCompleted
                              ? null
                              : () {
                                  context.go(
                                    "/meal-details",
                                    extra: {'_id': item.id},
                                  );
                                },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: CupertinoButton(
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: Text("Complete",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  onPressed: () async {
                    final api = ref.read(apiServiceProvider.notifier);
                    final snapshot = await api.getTodo();
                    final nutritions = snapshot?.meals
                        .map((meal) => meal.nutrition)
                        .where(
                            (n) => n.dishName != null && n.dishName!.isNotEmpty)
                        .toList();

                    final filteredData = _filterData(nutritions ?? []);

                    List<String> existingCompleted =
                        await SharedService.getCompletedTasks();

                    for (int i = 0; i < isCheckedList.length; i++) {
                      if (isCheckedList[i]) {
                        final item = filteredData[i];
                        if (!existingCompleted.contains(item.nutritionId)) {
                          existingCompleted.add(item.nutritionId ?? "");
                          await CustomNotification().cancelNotification(i);
                        }
                        isCheckedList[i] = false;
                      }
                    }

                    await SharedService.saveCompletedTasks(existingCompleted);
                    await _loadCompletedTasks();

                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "Tasks completed: ${existingCompleted.length}")),
                    );
                  },
                ),
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: CupertinoButton(
                    onPressed: () async {
                      SharedService.clearCompletedTasks();
                      await resetTodo(ref);
                      setState(() {});
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Center(
                        child: Text("Reset",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
