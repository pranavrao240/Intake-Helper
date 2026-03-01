import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NutritionSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const NutritionSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52, // fixed height prevents overflow
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(
            LucideIcons.search,
            color: Colors.white.withOpacity(0.35),
            size: 17,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: 'Search meals or nutrients...',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.28),
                  fontSize: 14,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (controller.text.isNotEmpty) ...[
            GestureDetector(
              onTap: () {
                controller.clear();
                onChanged('');
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.x,
                  color: Colors.white.withOpacity(0.5),
                  size: 11,
                ),
              ),
            ),
            const SizedBox(width: 14),
          ] else
            const SizedBox(width: 16),
        ],
      ),
    );
  }
}
