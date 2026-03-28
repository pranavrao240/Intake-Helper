import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/onboarding_provider.dart';
import 'package:intake_helper/pages/on%20boarding/widgets/onboarding_model.dart';

import 'onboarding_image_card.dart';
import 'onboarding_feature_list.dart';

/// Sliding content pane that animates in/out based on the direction state.
class OnboardingSlideContent extends HookConsumerWidget {
  const OnboardingSlideContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(onboardingStepProvider);
    final direction = ref.watch(slideDirectionProvider);

    final step = onboardingSteps[currentStep];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 320),
      transitionBuilder: (child, animation) {
        // Slide in from right (forward) or left (back)
        final offsetTween = Tween<Offset>(
          begin: Offset(direction > 0 ? 1.0 : -1.0, 0),
          end: Offset.zero,
        );
        return SlideTransition(
          position: offsetTween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      // Key is required so AnimatedSwitcher detects the change
      child: _StepContent(key: ValueKey(currentStep), step: step),
    );
  }
}

class _StepContent extends HookConsumerWidget {
  const _StepContent({super.key, required this.step});

  final OnboardingStep step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          OnboardingImageCard(step: step),
          const SizedBox(height: 28),

          // Title
          Text(
            step.title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: kTextPrimary,
              letterSpacing: -0.5,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),

          // Description
          Text(
            step.description,
            style: const TextStyle(
              fontSize: 15,
              color: kTextSub,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 24),

          // Features
          OnboardingFeatureList(step: step),
        ],
      ),
    );
  }
}
