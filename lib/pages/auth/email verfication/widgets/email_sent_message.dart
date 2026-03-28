import 'package:flutter/material.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class EmailSentMessage extends StatelessWidget {
  final String email;

  const EmailSentMessage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        const Icon(
          Icons.mark_email_read_rounded,
          size: 64,
          color: Color(0xFFE31E24),
        ),
        const SizedBox(height: 20),
        Text(
          locale.emailSentMessageTitle,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          locale.emailSentMessageLinkSentTo,
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
          locale.emailSentMessageCheckInbox,
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
