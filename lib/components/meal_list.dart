import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/models/nutrition_model.dart';

class MealList extends StatelessWidget {
  final List<Nutrition> meals;
  final ValueChanged<String> onMealTypeChange;
  final VoidCallback onDelete;

  const MealList(
      {required this.meals,
      required this.onMealTypeChange,
      required this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownMenu(
          textStyle: const TextStyle(color: Colors.white),
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: "Breakfast", label: "Breakfast"),
            DropdownMenuEntry(value: "Lunch", label: "Lunch"),
            DropdownMenuEntry(value: "Dinner", label: "Dinner"),
          ],
          onSelected: (value) {
            if (value != null) {
              onMealTypeChange(value);
            }
          },
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            return Card(
              color: Colors.black87,
              child: ListTile(
                title: Text(meal.dishName ?? '',
                    style: const TextStyle(color: Colors.white)),
                subtitle: Text(
                  "Calories: ${meal.calories ?? 0}, Protein: ${meal.protein ?? 0}g",
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete),
              ),
            );
          },
        ),
      ],
    );
  }
}
