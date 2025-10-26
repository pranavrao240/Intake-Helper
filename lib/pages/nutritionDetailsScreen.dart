import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/Providers/providers.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class NutritionDetailScreen extends ConsumerStatefulWidget {
  const NutritionDetailScreen({super.key});

  @override
  ConsumerState<NutritionDetailScreen> createState() =>
      _NutritionDetailScreenState();
}

class _NutritionDetailScreenState extends ConsumerState<NutritionDetailScreen> {
  String _id = '';
  List<String> eatType = ["Breakfast", "Lunch", "Dinner"];
  List<bool> isCheckedList = [false, false, false];
  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    return DateFormat.jm().format(dt); // returns '12:31 PM'
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    if (args != null) {
      setState(() {
        _id = args['_id']?.toString() ?? args['nutritionId']?.toString() ?? '';
      });
      print("Nutrition ID: $_id");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        title: const Text("Nutrition Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0xFF00FFAA), // Neon green gym accent
            )),
      ),

      body: SingleChildScrollView(
        child: _mealDetails(ref),
      ),
      backgroundColor: const Color(0xFF121212),
      // backgroundColor: const Color.fromARGB(255, 39, 38, 38),
    );
  }

  Future<void> openExactAlarmSettings() async {
    if (Platform.isAndroid) {
      final intent = const AndroidIntent(
        action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
        flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
      );
      await intent.launch();
    }
  }

  Widget _mealDetails(WidgetRef ref) {
    if (_id.isEmpty) {
      return const Center(
        child: Text(
          "No data available",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    final details = ref.watch(NutritionDetailsProvider(_id));

    return details.when(
      data: (model) {
        if (model == null) {
          return const Center(
              child: Text("No data available",
                  style: TextStyle(color: Colors.white)));
        }
        return _mealDetailsUI(model);
      },
      error: (error, stack) {
        return Center(
            child: Text("Error: $error",
                style: const TextStyle(color: Colors.white)));
      },
      loading: () {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading...', style: TextStyle(color: Colors.white)),
            ],
          ),
        );
      },
    );
  }

  Widget _mealDetailsUI(Nutrition model) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Text(
              model.dishName ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color.fromARGB(255, 248, 243, 243),
                width: 2.0,
              ),
            ),
            child: PieChart(
              dataMap: {
                "Calories": model.calories ?? 0.0,
                "Protein": model.protein ?? 0.0,
                "Carbohydrates": model.carbohydrates ?? 0.0,
              },
              chartType: ChartType.ring,
              colorList: const [
                Colors.red,
                Colors.blue,
                Colors.green,
              ],
              chartRadius: MediaQuery.of(context).size.width / 3.2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Nutrition Details",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _nutritionTile("Calories", "${model.calories} kcal"),
              _nutritionTile("Protein", "${model.protein} g"),
              _nutritionTile("Carbohydrates", "${model.carbohydrates} g"),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCheckboxTile(eatType[0], 0),
                  _buildCheckboxTile(eatType[1], 1),
                  _buildCheckboxTile(eatType[2], 2),
                ],
              ),
              const SizedBox(height: 16),
              // Padding(
              //   padding: const EdgeInsets.only(left: 390),
              //   child: GestureDetector(
              //     onTap: () => _toggleSelection(model),
              //     child: Icon(
              //       _isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              //       color: Colors.white,
              //       size: 30,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  TimeOfDay selectedTime = TimeOfDay.now();

                  List<String> selectedDays = [];
                  List<String> selectedType = [];

                  for (int i = 0; i < eatType.length; i++) {
                    if (isCheckedList[i]) {
                      selectedType.add(eatType[i]);
                    }
                  }

                  if (selectedType.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select at least one meal type!'),
                      ),
                    );
                    return;
                  }

                  await showDialog(
                    context: context,
                    builder: (context) {
                      return _TimeDayPickerDialog(
                        onConfirm: (time, days) {
                          selectedTime = time;
                          selectedDays = days;
                        },
                      );
                    },
                  );
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Permission Required"),
                      content: Text(
                          "To schedule reminders, allow 'Exact Alarms' in settings."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            openExactAlarmSettings();
                            Navigator.of(context).pop();
                          },
                          child: Text("Open Settings"),
                        ),
                      ],
                    ),
                  );

                  if (selectedDays.isEmpty) return;

                  String formattedTime =
                      "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}";

                  ScaffoldMessenger.of(context).showSnackBar(
                    // here should i put

                    SnackBar(
                      content: Text(
                        "Added for ${selectedDays.join(', ')} at $formattedTime",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );

                  print("Sending to API:");
                  print("Nutrition ID: ${model.id}");
                  print("Nutrition ID: ${model.dishName}");

                  print("Formatted Time: $formattedTime");
                  print("Selected Days: $selectedDays");
                  print("Selected Type: $selectedType");

                  final success = await ApiService().addTodoItem(
                    model.id ?? "",
                    formattedTime,
                    selectedDays.join(","),
                    selectedType.join(","),
                  );

                  if (success == true) {
                    Navigator.of(context).pushNamed("/todo-page");

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Added to Todo List"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Failed to add to Todo List"),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 18, 187, 221),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Add In your Todo List",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }

  bool _isBookmarked = false;

  void _toggleSelection(Nutrition model) {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isBookmarked ? 'Selected' : 'Not Selected',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _nutritionTile(String title, String value) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Colors.white, width: 1.0),
      ),
      trailing: Text(
        value,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

//
  Widget _buildCheckboxTile(String title, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color.fromARGB(255, 248, 243, 243),
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: isCheckedList[index],
            onChanged: (value) {
              setState(() {
                isCheckedList[index] = value ?? false;
              });
            },
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _TimeDayPickerDialog extends StatefulWidget {
  final void Function(TimeOfDay time, List<String> days) onConfirm;

  const _TimeDayPickerDialog({required this.onConfirm});

  @override
  State<_TimeDayPickerDialog> createState() => _TimeDayPickerDialogState();
}

class _TimeDayPickerDialogState extends State<_TimeDayPickerDialog> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  Set<String> _selectedDays = {};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 48, 47, 47),
      title: const Text(
        "Schedule Meal",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: _selectedTime,
                builder: (context, child) {
                  return Theme(data: ThemeData.dark(), child: child!);
                },
              );
              if (picked != null) {
                setState(() => _selectedTime = picked);
              }
            },
            child: Text(
              "Pick Time: ${_selectedTime.format(context)}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8.0,
            children: _days.map((day) {
              final isSelected = _selectedDays.contains(day);
              return ChoiceChip(
                label: Text(day,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 13, 13, 13))),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    isSelected
                        ? _selectedDays.remove(day)
                        : _selectedDays.add(day);
                  });
                },
                selectedColor: Colors.teal,
              );
            }).toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child:
              const Text("Cancel", style: TextStyle(color: Colors.redAccent)),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(_selectedTime, _selectedDays.toList());
            Navigator.pop(context);
          },
          child: const Text("Add", style: TextStyle(color: Colors.greenAccent)),
        ),
      ],
    );
  }
}
