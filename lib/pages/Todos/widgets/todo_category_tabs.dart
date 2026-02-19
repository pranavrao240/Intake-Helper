import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const List<String> _categories = ['All', 'Breakfast', 'Lunch', 'Dinner'];

class TodoCategoryTabs extends HookConsumerWidget {
  final ValueChanged<String>? onCategoryChanged;

  const TodoCategoryTabs({super.key, this.onCategoryChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState('All');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.08)),
        ),
      ),
      child: Row(
        children: _categories.map((category) {
          final isActive = selected.value == category;
          return GestureDetector(
            onTap: () {
              selected.value = category;
              onCategoryChanged?.call(category);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 28),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isActive
                          ? const Color(0xFFEF4444)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isActive
                        ? const Color(0xFFEF4444)
                        : const Color(0xFF71717A),
                    fontWeight:
                        isActive ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 14,
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
