import 'package:flutter/material.dart';
import 'package:intake_helper/theme/app_theme.dart';

Widget userBubble(String text, {required VoidCallback onEdit}) {
  return Align(
    alignment: Alignment.centerRight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(bottom: 6),
          constraints: const BoxConstraints(maxWidth: 280),
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, size: 16),
              color: Colors.white54,
              onPressed: onEdit,
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    ),
  );
}
