import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayItem {
  final String day;
  final DateTime date;
  const DayItem({required this.day, required this.date});

  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}

List<DayItem> _currentWeekDays() {
  final now = DateTime.now();
  final monday = now.subtract(Duration(days: now.weekday - 1));

  const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  return List.generate(7, (i) {
    final day = DateTime(monday.year, monday.month, monday.day + i);
    return DayItem(day: labels[i], date: day);
  });
}

class TodoDateSelector extends HookConsumerWidget {
  final ValueChanged<DateTime>? onDateChanged;

  const TodoDateSelector({super.key, this.onDateChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final days = useMemoized(_currentWeekDays);

    final today = DateTime.now();
    final selectedDate = useState<DateTime>(
      DateTime(today.year, today.month, today.day),
    );

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = days[index];
          final isSelected = selectedDate.value.day == item.date.day &&
              selectedDate.value.month == item.date.month &&
              selectedDate.value.year == item.date.year;

          return GestureDetector(
            onTap: () {
              selectedDate.value = item.date;
              onDateChanged?.call(item.date);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFDC2626), Color(0xFF2563EB)],
                      )
                    : null,
                color: isSelected ? null : const Color(0xFF18181B),
                borderRadius: BorderRadius.circular(18),
                border: isSelected
                    ? null
                    : Border.all(color: const Color(0xFF27272A)),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFFDC2626).withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.day,
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected
                          ? Colors.white
                          : item.isToday
                              ? const Color(
                                  0xFFEF4444) // red accent for today label
                              : const Color(0xFFA1A1AA),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item.date.day}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color:
                          isSelected ? Colors.white : const Color(0xFFD4D4D8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (isSelected || item.isToday)
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.white : const Color(0xFFEF4444),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
