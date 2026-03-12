import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const List<String> categories = ["All", "Breakfast", "Lunch", "Dinner"];

class TodoCategoryTabs extends HookWidget {
  final ValueChanged<String>? onCategoryChanged;

  const TodoCategoryTabs({super.key, this.onCategoryChanged});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState("All");

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: categories.map((cat) {
          final isSelected = selectedCategory.value == cat;
          return GestureDetector(
            onTap: () {
              selectedCategory.value = cat;
              onCategoryChanged?.call(cat);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? const Color(0xFF6D28D9)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  cat,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFF6D28D9)
                        : Colors.white.withValues(alpha: 0.25),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
