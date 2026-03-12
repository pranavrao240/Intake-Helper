import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/settings_providers.dart';

class UnitsSettingsPage extends HookConsumerWidget {
  const UnitsSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUnit = ref.watch(weightUnitProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Units'),
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
            children: WeightUnit.values.map((unit) {
              final isSelected = unit == currentUnit;
              final label =
                  unit == WeightUnit.kg ? 'Kilograms (kg)' : 'Pounds (lbs)';
              final emoji = unit == WeightUnit.kg ? '⚖️' : '🇺🇸';

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Text(emoji, style: const TextStyle(fontSize: 24)),
                    title: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle,
                            color: Colors.redAccent)
                        : const Icon(Icons.circle_outlined, color: Colors.grey),
                    onTap: () {
                      ref.read(weightUnitProvider.notifier).state = unit;
                      Navigator.of(context).pop();
                    },
                  ),
                  if (unit != WeightUnit.values.last)
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
