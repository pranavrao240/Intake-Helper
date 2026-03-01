import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intake_helper/theme/app_theme.dart';

Widget aiBubble(
  String text,
  BuildContext context, {
  required void Function(String) onSave,
}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(bottom: 6),
          constraints: const BoxConstraints(maxWidth: 280),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.copy, size: 18),
              color: Colors.white54,
              onPressed: () {
                Clipboard.setData(ClipboardData(text: text));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Copied to clipboard')),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up_alt_outlined, size: 18),
              color: Colors.white54,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thanks for your feedback!')),
                );
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.thumb_down_alt_outlined, size: 18),
              color: Colors.white54,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thanks for your feedback!')),
                );
              },
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.bookmark_border, size: 18),
              color: AppTheme.primaryBlue,
              onPressed: () => onSave(text),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    ),
  );
}
