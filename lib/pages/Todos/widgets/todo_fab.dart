import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoFAB extends HookConsumerWidget {
  final VoidCallback? onPressed;

  const TodoFAB({super.key, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFDC2626), Color(0xFF2563EB)],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFDC2626).withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 30),
      ),
    );
  }
}
