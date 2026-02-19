import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ─────────────────────────────────────────────
// Calendar Picker Widget
// ─────────────────────────────────────────────
class TodoCalendarPicker extends HookConsumerWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime>? onDateSelected;
  final VoidCallback? onClose;

  const TodoCalendarPicker({
    super.key,
    this.initialDate,
    this.onDateSelected,
    this.onClose,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateTime.now();
    final selectedDate = useState<DateTime>(initialDate ?? today);
    final displayedMonth = useState<DateTime>(
      DateTime(initialDate?.year ?? today.year, initialDate?.month ?? today.month),
    );

    final daysInMonth = _daysInMonth(displayedMonth.value);
    final firstWeekday = DateTime(displayedMonth.value.year, displayedMonth.value.month, 1).weekday % 7;

    void prevMonth() {
      final d = displayedMonth.value;
      displayedMonth.value = DateTime(d.year, d.month - 1);
    }

    void nextMonth() {
      final d = displayedMonth.value;
      displayedMonth.value = DateTime(d.year, d.month + 1);
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 40,
            offset: const Offset(0, 16),
          ),
          BoxShadow(
            color: const Color(0xFFDC2626).withOpacity(0.08),
            blurRadius: 60,
            offset: const Offset(-10, 0),
          ),
          BoxShadow(
            color: const Color(0xFF2563EB).withOpacity(0.08),
            blurRadius: 60,
            offset: const Offset(10, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Header ──
          _CalendarHeader(
            month: displayedMonth.value,
            onPrev: prevMonth,
            onNext: nextMonth,
            onClose: onClose,
          ),

          // ── Weekday Labels ──
          const _WeekdayLabels(),

          const SizedBox(height: 4),

          // ── Day Grid ──
          _DayGrid(
            daysInMonth: daysInMonth,
            firstWeekday: firstWeekday,
            displayedMonth: displayedMonth.value,
            selectedDate: selectedDate.value,
            today: today,
            onDayTap: (date) {
              selectedDate.value = date;
              onDateSelected?.call(date);
            },
          ),

          const SizedBox(height: 12),

          // ── Divider ──
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white.withOpacity(0.06),
          ),

          // ── Quick Select Chips ──
          _QuickSelectRow(
            today: today,
            onSelect: (date) {
              selectedDate.value = date;
              displayedMonth.value = DateTime(date.year, date.month);
              onDateSelected?.call(date);
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  static int _daysInMonth(DateTime month) =>
      DateTime(month.year, month.month + 1, 0).day;
}

// ─────────────────────────────────────────────
// Header: Month/Year + Nav Arrows + Close
// ─────────────────────────────────────────────
class _CalendarHeader extends StatelessWidget {
  final DateTime month;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback? onClose;

  const _CalendarHeader({
    required this.month,
    required this.onPrev,
    required this.onNext,
    this.onClose,
  });

  static const _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          // Month + Year
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _months[month.month - 1],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  '${month.year}',
                  style: const TextStyle(
                    color: Color(0xFF71717A),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // Nav + Close
          Row(
            children: [
              _NavButton(icon: Icons.chevron_left_rounded, onTap: onPrev),
              const SizedBox(width: 4),
              _NavButton(icon: Icons.chevron_right_rounded, onTap: onNext),
              if (onClose != null) ...[
                const SizedBox(width: 8),
                _NavButton(icon: Icons.close_rounded, onTap: onClose!),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.07)),
        ),
        child: Icon(icon, color: const Color(0xFF9CA3AF), size: 20),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Weekday Labels Row
// ─────────────────────────────────────────────
class _WeekdayLabels extends StatelessWidget {
  const _WeekdayLabels();

  static const _labels = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _labels
            .map((l) => SizedBox(
                  width: 36,
                  child: Center(
                    child: Text(
                      l,
                      style: const TextStyle(
                        color: Color(0xFF52525B),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Day Grid
// ─────────────────────────────────────────────
class _DayGrid extends HookWidget {
  final int daysInMonth;
  final int firstWeekday;
  final DateTime displayedMonth;
  final DateTime selectedDate;
  final DateTime today;
  final ValueChanged<DateTime> onDayTap;

  const _DayGrid({
    required this.daysInMonth,
    required this.firstWeekday,
    required this.displayedMonth,
    required this.selectedDate,
    required this.today,
    required this.onDayTap,
  });

  @override
  Widget build(BuildContext context) {
    final totalCells = firstWeekday + daysInMonth;
    final rows = (totalCells / 7).ceil();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(rows, (row) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (col) {
                final cellIndex = row * 7 + col;
                final dayNumber = cellIndex - firstWeekday + 1;

                if (dayNumber < 1 || dayNumber > daysInMonth) {
                  return const SizedBox(width: 36, height: 36);
                }

                final date = DateTime(
                    displayedMonth.year, displayedMonth.month, dayNumber);
                final isSelected = _isSameDay(date, selectedDate);
                final isToday = _isSameDay(date, today);
                final isPast = date.isBefore(today) && !isToday;

                return _DayCell(
                  day: dayNumber,
                  isSelected: isSelected,
                  isToday: isToday,
                  isPast: isPast,
                  onTap: () => onDayTap(date),
                );
              }),
            ),
          );
        }),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

// ─────────────────────────────────────────────
// Individual Day Cell
// ─────────────────────────────────────────────
class _DayCell extends HookWidget {
  final int day;
  final bool isSelected;
  final bool isToday;
  final bool isPast;
  final VoidCallback onTap;

  const _DayCell({
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.isPast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFDC2626), Color(0xFF2563EB)],
                )
              : null,
          color: isToday && !isSelected
              ? Colors.white.withOpacity(0.06)
              : null,
          borderRadius: BorderRadius.circular(10),
          border: isToday && !isSelected
              ? Border.all(color: const Color(0xFFEF4444).withOpacity(0.5))
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFDC2626).withOpacity(0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            '$day',
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : isPast
                      ? const Color(0xFF3F3F46)
                      : isToday
                          ? const Color(0xFFEF4444)
                          : const Color(0xFFD4D4D8),
              fontSize: 13,
              fontWeight: isSelected || isToday
                  ? FontWeight.w700
                  : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Quick Select Chips: Today / Yesterday / This Week
// ─────────────────────────────────────────────
class _QuickSelectRow extends StatelessWidget {
  final DateTime today;
  final ValueChanged<DateTime> onSelect;

  const _QuickSelectRow({required this.today, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final chips = [
      ('Today', today),
      ('Yesterday', today.subtract(const Duration(days: 1))),
      ('Last Week', today.subtract(const Duration(days: 7))),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(
        children: chips
            .map((chip) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => onSelect(chip.$2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C1E),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.07)),
                      ),
                      child: Text(
                        chip.$1,
                        style: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Helper: Show Calendar as Bottom Sheet
// ─────────────────────────────────────────────
Future<DateTime?> showTodoCalendarPicker({
  required BuildContext context,
  DateTime? initialDate,
}) async {
  DateTime? result;

  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (ctx) => Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      child: TodoCalendarPicker(
        initialDate: initialDate,
        onDateSelected: (date) => result = date,
        onClose: () => Navigator.of(ctx).pop(),
      ),
    ),
  );

  return result;
}
