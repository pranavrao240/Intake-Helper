import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/settings_providers.dart';
import 'package:intake_helper/pages/profile/widgets/reminder_settings_page.dart';
import 'package:intake_helper/pages/profile/widgets/units_settings_page.dart';
import 'package:intake_helper/pages/profile/widgets/language_page.dart';
import 'package:intake_helper/Providers/locale_provider.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class SettingsWidget extends HookConsumerWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = AppLocalizations.of(context)!;
    final darkMode = ref.watch(darkModeProvider);
    final weightUnit = ref.watch(weightUnitProvider);
    final reminderEnabled = ref.watch(reminderEnabledProvider);
    final reminderTime = ref.watch(reminderTimeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            appLocale.settingsTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Reminder Settings
              _SettingsTile(
                emoji: '🔔',
                title: appLocale.settingsReminder,
                subtitle: reminderEnabled
                    ? '${appLocale.settingsDailyAt}${reminderTime.format(context)}'
                    : appLocale.settingsOff,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ReminderSettingsPage(),
                    ),
                  );
                },
              ),
              _Divider(),

              // Units
              _SettingsTile(
                emoji: '⚖️',
                title: appLocale.settingsUnits,
                subtitle: weightUnit == WeightUnit.kg
                    ? appLocale.settingsKilograms
                    : appLocale.settingsPounds,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const UnitsSettingsPage(),
                    ),
                  );
                },
              ),
              _Divider(),

              // Dark Mode (inline toggle, no sub-page needed)
              _SettingsTileToggle(
                emoji: '🌙',
                title: appLocale.settingsDarkMode,
                value: darkMode,
                onChanged: (val) {
                  ref.read(darkModeProvider.notifier).state = val;
                },
              ),
              _Divider(),
              // Language
              _SettingsTile(
                emoji: '🌍',
                title: appLocale.settingsLanguage,
                subtitle: ref.watch(localeProvider).languageCode == 'en'
                    ? appLocale.languageEnglish
                    : appLocale.languageHindi,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LanguagePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- Shared Sub-Widgets ---

class _SettingsTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Text(emoji, style: const TextStyle(fontSize: 24)),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[400], fontSize: 12),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}

class _SettingsTileToggle extends HookConsumerWidget {
  final String emoji;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsTileToggle({
    required this.emoji,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Text(emoji, style: const TextStyle(fontSize: 24)),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.redAccent,
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Colors.grey[800],
      indent: 16,
      endIndent: 16,
    );
  }
}
