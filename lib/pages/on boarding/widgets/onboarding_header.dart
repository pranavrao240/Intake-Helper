import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/onboarding_provider.dart';
import 'package:intake_helper/pages/on%20boarding/widgets/onboarding_model.dart';

/// Header row: glowing icon badge + step counter + Skip button.
class OnboardingHeader extends HookConsumerWidget {
  const OnboardingHeader({super.key, required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(onboardingStepProvider);
    final step = onboardingSteps[currentStep];
    final total = onboardingSteps.length;
    final isLast = currentStep == total - 1;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Row(
        children: [
          // Glowing indigo icon badge
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: kAccentGradient,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: kAccentBlue.withOpacity(0.45),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(step.icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Text(
            '${currentStep + 1} of $total',
            style: const TextStyle(
              fontSize: 13,
              color: kTextMuted,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
          ),
          const Spacer(),
          if (!isLast)
            GestureDetector(
              onTap: onSkip,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: kBgBase.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kBorder),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 13,
                    color: kTextMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
