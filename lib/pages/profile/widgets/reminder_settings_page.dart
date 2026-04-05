import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/settings_providers.dart';

class ReminderSettingsPage extends HookConsumerWidget {
  const ReminderSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderEnabled = ref.watch(reminderEnabledProvider);
    final reminderTime = ref.watch(reminderTimeProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Reminder Settings'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Enable toggle
              ListTile(
                leading: const Text('🔔', style: TextStyle(fontSize: 24)),
                title: const Text(
                  'Daily Reminder',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  reminderEnabled
                      ? 'Tap time below to change'
                      : 'Turn on to set a reminder',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
                trailing: Switch(
                  value: reminderEnabled,
                  onChanged: (val) =>
                      ref.read(reminderEnabledProvider.notifier).state = val,
                  activeColor: Colors.redAccent,
                ),
              ),

              if (reminderEnabled) ...[
                Divider(
                    color: Colors.grey[800],
                    height: 1,
                    indent: 16,
                    endIndent: 16),
                ListTile(
                  leading: const Text('⏰', style: TextStyle(fontSize: 24)),
                  title: const Text(
                    'Reminder Time',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    reminderTime.format(context),
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: reminderTime,
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.dark().copyWith(
                            colorScheme: const ColorScheme.dark(
                              primary: Colors.redAccent,
                              onSurface: Colors.white,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      ref.read(reminderTimeProvider.notifier).state = picked;
                    }
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
