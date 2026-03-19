import 'package:flutter/material.dart';

class EmailSentMessage extends StatelessWidget {
  final String email;

  const EmailSentMessage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.mark_email_read_rounded,
          size: 64,
          color: Color(0xFFE31E24),
        ),
        const SizedBox(height: 20),
        const Text(
          "Verify your email",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "A verification link has been sent to",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          email,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Please check your inbox and click the link to verify your account.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
