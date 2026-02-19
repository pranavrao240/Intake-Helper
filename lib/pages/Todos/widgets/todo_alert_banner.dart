import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoAlertBanner extends HookConsumerWidget {
  final String message;
  final VoidCallback? onMarkDone;
  final VoidCallback? onSnooze;

  const TodoAlertBanner({
    super.key,
    this.message = 'Lunch in 20 minutes',
    this.onMarkDone,
    this.onSnooze,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDC2626), Color(0xFF2563EB)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFDC2626).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text('⚠️', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _AlertChip(label: 'Mark Done', onTap: onMarkDone),
              const SizedBox(width: 8),
              _AlertChip(label: 'Snooze', onTap: onSnooze),
            ],
          ),
        ],
      ),
    );
  }
}

class _AlertChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _AlertChip({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
