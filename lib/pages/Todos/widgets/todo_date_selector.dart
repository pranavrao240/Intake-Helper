import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayItem {
  final String day;
  final int date;
  final bool isToday;

  const DayItem({required this.day, required this.date, this.isToday = false});
}

final List<DayItem> _days = [
  DayItem(day: 'Mon', date: 12),
  DayItem(day: 'Tue', date: 13),
  DayItem(day: 'Wed', date: 14, isToday: true),
  DayItem(day: 'Thu', date: 15),
  DayItem(day: 'Fri', date: 16),
  DayItem(day: 'Sat', date: 17),
  DayItem(day: 'Sun', date: 18),
];

class TodoDateSelector extends HookConsumerWidget {
  const TodoDateSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = useState<int>(14);

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        itemCount: _days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = _days[index];
          final isSelected = selectedDate.value == item.date;

          return GestureDetector(
            onTap: () => selectedDate.value = item.date,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                          : const Color(0xFFA1A1AA),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item.date}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : const Color(0xFFD4D4D8),
                    ),
                  ),
                  if (isSelected) ...[
                    const SizedBox(height: 4),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
