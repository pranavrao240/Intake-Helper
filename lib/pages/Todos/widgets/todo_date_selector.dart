import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class DayItem {
  final String day;
  final DateTime date;

  DayItem({required this.day, required this.date});

  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}

List<DayItem> _getWeekDays(DateTime selectedDate) {
  final now = selectedDate;
  final monday = now.subtract(Duration(days: now.weekday - 1));
  final labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  return List.generate(7, (i) {
    final date = DateTime(monday.year, monday.month, monday.day + i);
    return DayItem(day: labels[i], date: date);
  });
}

class TodoDateSelector extends HookWidget {
  final ValueChanged<DateTime> onDateChanged;
  final DateTime initialDate;

  const TodoDateSelector({
    super.key,
    required this.onDateChanged,
    required this.initialDate,
  });

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState(initialDate);
    final weekDays = useMemoized(() => _getWeekDays(selectedDate.value), [
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day
    ]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: weekDays.map((item) {
          final isSelected = selectedDate.value.day == item.date.day;
          return GestureDetector(
            onTap: () {
              selectedDate.value = item.date;
              onDateChanged(item.date);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 48,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF6D28D9)
                    : Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : Colors.white.withOpacity(0.1),
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFFDC2626).withOpacity(0.4),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.day,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.4),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${item.date.day}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (item.isToday)
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white.withOpacity(0.8)
                            : const Color(0xFFDC2626),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
