import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/onboarding_provider.dart';
import 'package:intake_helper/pages/on%20boarding/widgets/onboarding_model.dart';

/// Animated dot indicators at the bottom — active dot expands to a glowing pill.
class OnboardingDotIndicators extends HookConsumerWidget {
  const OnboardingDotIndicators({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(onboardingStepProvider);
    final stepNotifier = ref.read(onboardingStepProvider.notifier);
    final directionNotifier = ref.read(slideDirectionProvider.notifier);
    final total = onboardingSteps.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final isActive = i == currentStep;
        return GestureDetector(
          onTap: () {
            directionNotifier.state = i > currentStep ? 1 : -1;
            stepNotifier.goTo(i);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 28 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: isActive ? kAccentGradient : null,
              color: isActive ? null : kBgMid,
              border: isActive ? null : Border.all(color: kBorder, width: 1),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: kAccentBlue.withOpacity(0.5),
                        blurRadius: 8,
                      )
                    ]
                  : null,
            ),
          ),
        );
      }),
    );
  }
}
