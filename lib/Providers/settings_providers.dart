import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// --- Enums ---
enum WeightUnit { kg, lbs }

// --- Providers ---

final darkModeProvider = StateProvider<bool>((ref) => true);

final weightUnitProvider = StateProvider<WeightUnit>((ref) => WeightUnit.kg);

final reminderEnabledProvider = StateProvider<bool>((ref) => true);

final reminderTimeProvider = StateProvider<TimeOfDay>(
  (ref) => const TimeOfDay(hour: 8, minute: 0),
);
