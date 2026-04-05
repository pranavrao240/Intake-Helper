import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/locale_provider.dart';
import 'package:intake_helper/l10n/app_localizations.dart';
class LanguagePage extends HookConsumerWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final appLocale = AppLocalizations.of(context)!;

    final languages = [
      {'code': 'en', 'label': appLocale.languageEnglish, 'emoji': '🇺🇸'},
      {'code': 'hi', 'label': appLocale.languageHindi, 'emoji': '🇮🇳'},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(appLocale.settingsLanguage),
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
            children: languages.asMap().entries.map((entry) {
              final index = entry.key;
              final lang = entry.value;
              final isSelected = lang['code'] == currentLocale.languageCode;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Text(lang['emoji']!, style: const TextStyle(fontSize: 24)),
                    title: Text(
                      lang['label']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle, color: Colors.redAccent)
                        : const Icon(Icons.circle_outlined, color: Colors.grey),
                    onTap: () {
                      ref.read(localeProvider.notifier).state = Locale(lang['code']!);
                      Navigator.of(context).pop();
                    },
                  ),
                  if (index != languages.length - 1)
                    Divider(
                      color: Colors.grey[800],
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
