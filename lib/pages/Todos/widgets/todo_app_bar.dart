import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/Todos/widgets/todo_calendar_picker.dart';

class TodoAppBar extends HookConsumerWidget {
  const TodoAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 52, 24, 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A),
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                "Today's Meals",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFDC2626), Color(0xFF2563EB)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFDC2626).withOpacity(0.35),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Text(
                  '🔥 7',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              _IconBtn(
                icon: Icons.notifications_outlined,
                onTap: () {
                  //TODO: Implement notification page
                },
              ),
              const SizedBox(width: 18),
              _IconBtn(
                  icon: Icons.calendar_today_outlined,
                  onTap: () async {
                    //TODO: Implement calendar picker
                    final date = await showTodoCalendarPicker(
                      context: context,
                      initialDate: DateTime.now(),
                    );
                    if (date != null) {
                      // filter your meals by date
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _IconBtn({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Icon(icon, color: const Color(0xFF71717A), size: 24),
    );
  }
}
