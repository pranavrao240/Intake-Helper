import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/Providers/providers.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/utility/notification.dart';
import 'package:intake_helper/widgets/top_bar.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class NutritionDetailScreen extends ConsumerStatefulWidget {
  const NutritionDetailScreen({super.key, required this.id});

  final String id;

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

    _id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: "Nutrition Details",
      ),
      body: SingleChildScrollView(
        child: _mealDetails(ref),
      ),
      backgroundColor: const Color(0xFF121212),
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
            children: [
              SizedBox(
                height: 20,
              ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.dishName ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  ' (${model.quantityRequired ?? ''})',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
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
              legendOptions: const LegendOptions(
                legendTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                showLegends: true,
                legendPosition: LegendPosition.right,
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: true,
                decimalPlaces: 0,
                chartValueStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dataMap: {
                "Calories": (model.calories ?? 0.0).toDouble(),
                "Protein": (model.protein ?? 0.0).toDouble(),
                "Carbohydrates": (model.carbohydrates ?? 0.0).toDouble(),
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
              Wrap(
                spacing: 12, // horizontal gap
                runSpacing: 8, // vertical gap
                children: List.generate(eatType.length, (index) {
                  return _buildCheckboxTile(eatType[index], index);
                }),
              ),
              const SizedBox(height: 16),
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
                        onConfirm: (time, days) async {
                          selectedTime = time;
                          selectedDays = days;

                          for (String day in selectedDays) {
                            scheduleForMultipleDays(
                              title: model.dishName!,
                              body: "Time to eat your scheduled meal!",
                              time: selectedTime,
                              days: selectedDays,
                            );
                          }
                        },
                      );
                    },
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

                  final success = await ApiService().addTodoItem(
                    model.id ?? "",
                    formattedTime,
                    selectedDays.join(","),
                    selectedType.join(","),
                  );

                  if (success == true) {
                    context.push("/todo");

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
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.greenAccent, Colors.green],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.45),
                          offset: const Offset(0, 8),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Add In your Todo List ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.5,
                          fontWeight: FontWeight.w700,
                        ),
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

  Widget _buildCheckboxTile(String title, int index) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              visualDensity: VisualDensity.compact,
              value: isCheckedList[index],
              onChanged: (value) {
                setState(() {
                  isCheckedList[index] = value ?? false;
                });
              },
            ),
            Flexible(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
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
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final Set<String> _selectedDays = {};

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
          onPressed: () => context.pop(),
          child:
              const Text("Cancel", style: TextStyle(color: Colors.redAccent)),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(_selectedTime, _selectedDays.toList());

            context.pop();
          },
          child: const Text("Add", style: TextStyle(color: Colors.greenAccent)),
        ),
      ],
    );
  }
}
