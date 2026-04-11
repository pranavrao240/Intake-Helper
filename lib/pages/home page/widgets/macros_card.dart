import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/settings_providers.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/common_functions/units_conversion.dart';
import 'package:intake_helper/constants/macro_stats.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

Map<String, double> calculateTargets({
  required double weightKg,
  required double heightCm,
  required int age,
  required Gender gender,
  required ActivityLevel activityLevel,
  required Goal goal,
}) {
  final double bmr = gender == Gender.male
      ? (10 * weightKg) + (6.25 * heightCm) - (5 * age) + 5
      : (10 * weightKg) + (6.25 * heightCm) - (5 * age) - 161;

  const multipliers = {
    ActivityLevel.sedentary: 1.2,
    ActivityLevel.light: 1.375,
    ActivityLevel.moderate: 1.55,
    ActivityLevel.heavy: 1.725,
  };
  final double tdee = bmr * multipliers[activityLevel]!;

  final double targetCalories = switch (goal) {
    Goal.fatLoss => tdee - 400,
    Goal.muscleGain => tdee + 400,
    Goal.maintain => tdee - 100,
  };

  final double proteinMultiplier = switch (goal) {
    Goal.fatLoss => 2.1,
    Goal.muscleGain => 1.8,
    Goal.maintain => 1.8,
  };

  final double proteinG = proteinMultiplier * weightKg;
  final double fatG = 0.8 * weightKg;
  final double carbsG = max(0, (targetCalories - proteinG * 4 - fatG * 9) / 4);

  return {
    'calories': targetCalories,
    'protein': proteinG,
    'fats': fatG,
    'carbs': carbsG,
  };
}

// ── Main card widget ─────────────────────────────────────────────────────────

class MacrosCard extends HookConsumerWidget {
  const MacrosCard({
    super.key,
    required this.macros,
    required this.targets,
    required this.onTargetSaved,
  });

  final Map<String, double> macros;
  final Map<String, double>? targets;
  final ValueChanged<Map<String, double>> onTargetSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsConversion = ref.read(weightUnitProvider);
    final isKg = useState(unitsConversion == WeightUnit.kg);

    if (targets == null) {
      return _NoTargetCard(onSetTarget: () {
        showSetTargetSheet(context, (value) {
          onTargetSaved(value); // 🔥 THIS IS THE FIX
        });
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111127),
          border: Border.all(color: Colors.white.withOpacity(0.07)),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replace the current Text widget (lines 100-108) with:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.macrosCardTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showSetTargetSheet(context, (newTargets) {
                      onTargetSaved(newTargets);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white.withValues(alpha: 0.7),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            _macroBar(
                label: AppLocalizations.of(context)!.macrosCardCalories,
                current: macros['calories'] ?? 0,
                target: targets!['calories'] ?? 0,
                unit: 'kcal',
                colors: const [Color(0xFF2563EB), Color(0xFF60A5FA)],
                isKg: isKg.value,
                ref: ref),
            _macroBar(
                label: AppLocalizations.of(context)!.macrosCardProtein,
                current: macros['protein'] ?? 0,
                target: targets!['protein'] ?? 0,
                unit: 'g',
                colors: const [Color(0xFF7C3AED), Color(0xFFEC4899)],
                isKg: isKg.value,
                ref: ref),
            _macroBar(
                label: AppLocalizations.of(context)!.macrosCardCarbs,
                current: macros['carbs'] ?? 0,
                target: targets!['carbs'] ?? 0,
                unit: 'g',
                colors: const [Color(0xFF2563EB), Color(0xFF60A5FA)],
                isKg: isKg.value,
                ref: ref),
            _macroBar(
                label: AppLocalizations.of(context)!.macrosCardFats,
                current: macros['fats'] ?? 0,
                target: targets!['fats'] ?? 0,
                unit: 'g',
                colors: const [Color(0xFF6B7280), Color(0xFF9CA3AF)],
                isKg: isKg.value,
                ref: ref,
                isLast: true),
          ],
        ),
      ),
    );
  }
}

// ── Empty state card ─────────────────────────────────────────────────────────

class _NoTargetCard extends StatelessWidget {
  const _NoTargetCard({required this.onSetTarget});
  final VoidCallback onSetTarget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111127),
          border: Border.all(color: Colors.white.withOpacity(0.07)),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s macros',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3),
            ),
            const SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.15)),
                    ),
                    child: Icon(Icons.add,
                        color: Colors.white.withOpacity(0.4), size: 22),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No daily target set yet.\nSet one to track your progress.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.45),
                        fontSize: 13,
                        height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Set-target bottom sheet ───────────────────────────────────────────────────

void showSetTargetSheet(
    BuildContext context, ValueChanged<Map<String, double>> onSaved) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _SetTargetSheet(onSaved: onSaved),
  );
}

class _SetTargetSheet extends HookConsumerWidget {
  const _SetTargetSheet({required this.onSaved});
  final ValueChanged<Map<String, double>> onSaved; // ✅ passes targets back

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(apiServiceProvider);
    final userStats = profileState.value?.profileData;
    final weightCtrl =
        useTextEditingController(text: userStats?.weight?.toString() ?? '0');
    final heightCtrl =
        useTextEditingController(text: userStats?.height?.toString() ?? '0');
    final ageCtrl =
        useTextEditingController(text: userStats?.age?.toString() ?? '0');
    final gender = useState<Gender>(userStats?.gender?.toString().toLowerCase() == 'female' ? Gender.female : Gender.male);
    final activity = useState(ActivityLevel.moderate);
    final goal = useState(Goal.fatLoss);

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF111127),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Set your daily target',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              const SizedBox(height: 20),
              Row(children: [
                Expanded(
                    child: _SheetField(
                        controller: weightCtrl,
                        label: 'WEIGHT (kg)',
                        hint: '70',
                        keyboardType: TextInputType.number)),
                const SizedBox(width: 12),
                Expanded(
                    child: _SheetField(
                        controller: heightCtrl,
                        label: 'HEIGHT (cm)',
                        hint: '170',
                        keyboardType: TextInputType.number)),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                    child: _SheetField(
                        controller: ageCtrl,
                        label: 'AGE',
                        hint: '22',
                        keyboardType: TextInputType.number)),
                const SizedBox(width: 12),
                Expanded(
                    child: _SheetDropdown<Gender>(
                  label: 'GENDER',
                  value: gender.value,
                  items: const [
                    DropdownMenuItem(value: Gender.male, child: Text('Male')),
                    DropdownMenuItem(
                        value: Gender.female, child: Text('Female')),
                  ],
                  onChanged: (v) => gender.value = v ?? Gender.male,
                )),
              ]),
              const SizedBox(height: 12),
              _SheetDropdown<ActivityLevel>(
                label: 'ACTIVITY LEVEL',
                value: activity.value,
                items: const [
                  DropdownMenuItem(
                      value: ActivityLevel.sedentary, child: Text('Sedentary')),
                  DropdownMenuItem(
                      value: ActivityLevel.light, child: Text('Light')),
                  DropdownMenuItem(
                      value: ActivityLevel.moderate, child: Text('Moderate')),
                  DropdownMenuItem(
                      value: ActivityLevel.heavy, child: Text('Heavy')),
                ],
                onChanged: (v) => activity.value = v!,
              ),
              const SizedBox(height: 12),
              _SheetDropdown<Goal>(
                label: 'GOAL',
                value: goal.value,
                items: const [
                  DropdownMenuItem(
                      value: Goal.fatLoss, child: Text('Fat loss')),
                  DropdownMenuItem(
                      value: Goal.muscleGain, child: Text('Muscle gain')),
                  DropdownMenuItem(
                      value: Goal.maintain, child: Text('Maintain / recomp')),
                ],
                onChanged: (v) => goal.value = v!,
              ),
              const SizedBox(height: 24),
              Row(children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      final result = calculateTargets(
                        weightKg: double.tryParse(weightCtrl.text) ?? 70,
                        heightCm: double.tryParse(heightCtrl.text) ?? 170,
                        age: int.tryParse(ageCtrl.text) ?? 22,
                        gender: gender.value,
                        activityLevel: activity.value,
                        goal: goal.value,
                      );
                      Navigator.pop(context);
                      onSaved(result); // ✅ passes calculated targets back
                    },
                    child: const Text('Calculate & save'),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Small reusable sheet widgets ──────────────────────────────────────────────

class _SheetField extends StatelessWidget {
  const _SheetField(
      {required this.controller,
      required this.label,
      required this.hint,
      this.keyboardType});
  final TextEditingController controller;
  final String label, hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                color: Colors.grey)),
        const SizedBox(height: 6),
        TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(hintText: hint)),
      ],
    );
  }
}

class _SheetDropdown<T> extends StatelessWidget {
  const _SheetDropdown(
      {required this.label,
      required this.value,
      required this.items,
      required this.onChanged});
  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                color: Colors.grey)),
        const SizedBox(height: 6),
        // Replace the current DropdownButtonFormField with styled version:
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Select $label',
            hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.08),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: Colors.white.withValues(alpha: 0.15)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: Colors.white.withValues(alpha: 0.15)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          dropdownColor: const Color(0xFF1A1A2E),
          style: const TextStyle(color: Colors.white),
          icon: Icon(Icons.arrow_drop_down,
              color: Colors.white.withValues(alpha: 0.7)),
        ),
      ],
    );
  }
}

Widget _macroBar({
  required String label,
  required double current,
  required double target,
  required String unit,
  required List<Color> colors,
  required WidgetRef ref,
  required bool isKg,
  bool isLast = false,
}) {
  current = isKg
      ? double.parse(current.toStringAsFixed(2))
      : double.parse(kilogramsToPounds(current).toStringAsFixed(2));
  target = isKg
      ? double.parse(target.toStringAsFixed(2))
      : double.parse(kilogramsToPounds(target).toStringAsFixed(2));
  final percent = (current / target).clamp(0.0, 1.0);

  return Padding(
    padding: EdgeInsets.only(bottom: isLast ? 16 : 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.45),
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.4,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$current',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' / ',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.25),
                      fontSize: 13,
                    ),
                  ),
                  TextSpan(
                    text: '$target',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.55),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' $unit',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 5,
            color: Colors.white.withOpacity(0.07),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutCubic,
                      width: constraints.maxWidth * percent,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: colors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
