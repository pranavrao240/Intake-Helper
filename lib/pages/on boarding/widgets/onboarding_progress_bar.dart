import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/onboarding_provider.dart';
import 'package:intake_helper/pages/on%20boarding/widgets/onboarding_model.dart';

/// Animated indigo→violet progress bar matching the app's macro bar style.
class OnboardingProgressBar extends HookConsumerWidget {
  const OnboardingProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(onboardingStepProvider);
    final total = onboardingSteps.length;
    final progress = (currentStep + 1) / total;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 5,
          child: Stack(
            children: [
              // Track — dark surface
              Container(width: double.infinity, color: kBgBase),
              // Glowing fill
              AnimatedFractionallySizedBox(
                widthFactor: progress,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: kAccentGradient,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x886366F1),
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
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
