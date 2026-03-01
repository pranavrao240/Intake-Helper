import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _kRed = Color(0xFFE53935);

class PhysicalStats {
  final double? height; // cm
  final double? weight; // kg
  final int? age;
  final String? gender;
  final double? bodyFat; // %

  const PhysicalStats({
    this.height,
    this.weight,
    this.age,
    this.gender,
    this.bodyFat,
  });

  PhysicalStats copyWith({
    double? height,
    double? weight,
    int? age,
    String? gender,
    double? bodyFat,
  }) =>
      PhysicalStats(
        height: height ?? this.height,
        weight: weight ?? this.weight,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        bodyFat: bodyFat ?? this.bodyFat,
      );
}

class PhysicalStatsNotifier extends StateNotifier<PhysicalStats> {
  PhysicalStatsNotifier() : super(const PhysicalStats());
  void update(PhysicalStats stats) => state = stats;
}

final physicalStatsProvider =
    StateNotifierProvider<PhysicalStatsNotifier, PhysicalStats>(
  (ref) => PhysicalStatsNotifier(),
);

class PhysicalStatsEditModal extends HookConsumerWidget {
  const PhysicalStatsEditModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(physicalStatsProvider);

    final heightCtrl =
        useTextEditingController(text: stats.height?.toString() ?? '');
    final weightCtrl =
        useTextEditingController(text: stats.weight?.toString() ?? '');
    final ageCtrl = useTextEditingController(text: stats.age?.toString() ?? '');
    final bodyFatCtrl =
        useTextEditingController(text: stats.bodyFat?.toString() ?? '');
    final selectedGender = useState<String>(stats.gender ?? 'Male');
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final isSaving = useState(false);

    Future<void> handleSave() async {
      if (!(formKey.currentState?.validate() ?? false)) return;
      isSaving.value = true;
      await Future.delayed(const Duration(milliseconds: 400));
      ref.read(physicalStatsProvider.notifier).update(
            stats.copyWith(
              height: double.tryParse(heightCtrl.text),
              weight: double.tryParse(weightCtrl.text),
              age: int.tryParse(ageCtrl.text),
              gender: selectedGender.value,
              bodyFat: double.tryParse(bodyFatCtrl.text),
            ),
          );
      isSaving.value = false;
      if (context.mounted) Navigator.of(context).pop();
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF2A2A2A)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.7),
              blurRadius: 40,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 16, 18),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFF1E1E1E)),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: _kRed.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.monitor_weight_outlined,
                        color: _kRed,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Physical Stats',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          color: Color(0xFF888888),
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _StatField(
                            controller: heightCtrl,
                            label: 'Height',
                            unit: 'cm',
                            icon: Icons.height_rounded,
                            hint: '00',
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d{0,3}\.?\d{0,1}')),
                            ],
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'Required';
                              final val = double.tryParse(v);
                              if (val == null || val < 50 || val > 300) {
                                return '50–300 cm';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatField(
                            controller: weightCtrl,
                            label: 'Weight',
                            unit: 'kg',
                            icon: Icons.fitness_center_rounded,
                            hint: '75',
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d{0,3}\.?\d{0,1}')),
                            ],
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'Required';
                              final val = double.tryParse(v);
                              if (val == null || val < 20 || val > 500) {
                                return '20–500 kg';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _StatField(
                            controller: ageCtrl,
                            label: 'Age',
                            unit: 'yrs',
                            icon: Icons.cake_outlined,
                            hint: '25',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'Required';
                              final val = int.tryParse(v);
                              if (val == null || val < 1 || val > 120) {
                                return '1–120 yrs';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatField(
                            controller: bodyFatCtrl,
                            label: 'Body Fat',
                            unit: '%',
                            icon: Icons.percent_rounded,
                            hint: '18',
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d{0,2}\.?\d{0,1}')),
                            ],
                            validator: (v) {
                              if (v != null && v.isNotEmpty) {
                                final val = double.tryParse(v);
                                if (val == null || val < 1 || val > 70) {
                                  return '1–70%';
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _GenderSelector(selected: selectedGender),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: GestureDetector(
                  onTap: isSaving.value ? null : handleSave,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 52,
                    decoration: BoxDecoration(
                      color:
                          isSaving.value ? _kRed.withValues(alpha: 0.5) : _kRed,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: isSaving.value
                          ? []
                          : [
                              BoxShadow(
                                color: _kRed.withValues(alpha: 0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                    ),
                    alignment: Alignment.center,
                    child: isSaving.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Save Stats',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatField extends HookWidget {
  final TextEditingController controller;
  final String label;
  final String unit;
  final IconData icon;
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;

  const _StatField({
    required this.controller,
    required this.label,
    required this.unit,
    required this.icon,
    required this.hint,
    required this.keyboardType,
    required this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isFocused = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black, size: 12),
            const SizedBox(width: 5),
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: Color(0xFF777777),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Focus(
          onFocusChange: (f) => isFocused.value = f,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isFocused.value ? _kRed : const Color(0xFF2A2A2A),
                width: isFocused.value ? 1.5 : 1,
              ),
              boxShadow: isFocused.value
                  ? [
                      BoxShadow(
                        color: _kRed.withValues(alpha: 0.15),
                        blurRadius: 8,
                        spreadRadius: 0,
                      )
                    ]
                  : [],
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              validator: validator,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFF3A3A3A),
                  fontSize: 16,
                ),
                suffixText: unit,
                suffixStyle: const TextStyle(
                  color: _kRed,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                border: InputBorder.none,
                errorStyle: const TextStyle(
                  color: _kRed,
                  fontSize: 10,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GenderSelector extends HookWidget {
  final ValueNotifier<String> selected;

  const _GenderSelector({required this.selected});

  @override
  Widget build(BuildContext context) {
    const options = ['Male', 'Female', 'Other'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.wc_rounded, color: Color(0xFF777777), size: 12),
            SizedBox(width: 5),
            Text(
              'GENDER',
              style: TextStyle(
                color: Color(0xFF777777),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: options.map((opt) {
            final isSelected = selected.value == opt;
            final isLast = opt == options.last;
            return Expanded(
              child: GestureDetector(
                onTap: () => selected.value = opt,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  margin: EdgeInsets.only(right: isLast ? 0 : 8),
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _kRed.withValues(alpha: 0.15)
                        : const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? _kRed : const Color(0xFF2A2A2A),
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    opt,
                    style: TextStyle(
                      color:
                          isSelected ? Colors.white : const Color(0xFF555555),
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
