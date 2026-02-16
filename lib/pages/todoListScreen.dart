import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/todo_model.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/router.dart';
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
            child: FutureBuilder<TodoResponse?>(
              future: api.getTodo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData ||
                    snapshot.data!.data!.meals.isEmpty) {
                  return const Center(child: Text("No nutrition data found."));
                } else {
                  final nutritions = snapshot.data!.data!.meals
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

                      final isCompleted = completedIds.contains(item.id);

                      return Card(
                          color: isCompleted
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFF1E1E1E),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: ListTile(
                            enabled: !isCompleted,
                            title: Text(
                              item.dishName ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                decoration: isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: isCompleted ? Colors.grey : Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              "Calories: ${item.calories ?? 0} | Protein: ${item.protein ?? 0}g\n⏰ ${item.time ?? 'N/A'}",
                              style: TextStyle(
                                fontSize: 13,
                                color:
                                    isCompleted ? Colors.grey : Colors.white70,
                              ),
                            ),
                            leading: Checkbox(
                              value: isCheckedList[index],
                              activeColor: Colors.deepOrange,
                              checkColor: Colors.white,
                              side: const BorderSide(color: Colors.white54),
                              onChanged: isCompleted
                                  ? null
                                  : (value) {
                                      setState(() {
                                        isCheckedList[index] = value ?? false;
                                      });
                                    },
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              color: Colors.redAccent,
                              onPressed: isCompleted
                                  ? null
                                  : () {
                                      api
                                          .deleteTodoItem(item.id ?? "")
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
                                    if (item.id != null) {
                                      context.pushNamed(
                                        RouteConstants.mealDetails.name,
                                        pathParameters: {'id': item.id!},
                                      );
                                    }
                                  },
                          ));
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
                    width: 140,
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.deepOrange, Colors.orangeAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Complete",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onPressed: () async {
                    final api = ref.read(apiServiceProvider.notifier);
                    final snapshot = await api.getTodo();
                    final nutritions = snapshot?.data?.meals
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
                        if (!existingCompleted.contains(item.id)) {
                          existingCompleted.add(item.id ?? "");
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
                          width: 140,
                          height: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.redAccent,
                              width: 1.5,
                            ),
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.refresh_rounded,
                                    color: Colors.redAccent, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  "Reset",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ))))
            ],
          )
        ],
      ),
    );
  }
}
