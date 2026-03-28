import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/on%20boarding/widgets/onboarding_model.dart';

import '/../Providers/onboarding_provider.dart';
import 'onboarding_dot_indicators.dart';

/// Frosted-glass bottom bar with Back / Continue / Get Started buttons.
class OnboardingBottomBar extends HookConsumerWidget {
  const OnboardingBottomBar({
    super.key,
    required this.onComplete,
  });

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(onboardingStepProvider);
    final stepNotifier = ref.read(onboardingStepProvider.notifier);
    final directionNotifier = ref.read(slideDirectionProvider.notifier);
    final total = onboardingSteps.length;
    final isLast = currentStep == total - 1;
    final isFirst = currentStep == 0;

    void handleNext() {
      if (isLast) {
        onComplete();
      } else {
        directionNotifier.state = 1;
        stepNotifier.next(total);
      }
    }

    void handlePrev() {
      directionNotifier.state = -1;
      stepNotifier.prev();
    }

    return Container(
      decoration: BoxDecoration(
        color: kBgCard,
        border: Border(
          top: BorderSide(color: kBorder, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 32,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(
        24,
        16,
        24,
        MediaQuery.of(context).padding.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // Back button
              if (!isFirst) ...[
                _CircleButton(
                  icon: Icons.chevron_left_rounded,
                  onTap: handlePrev,
                ),
                const SizedBox(width: 12),
              ],

              // Continue / Get Started — indigo→violet gradient
              Expanded(
                child: GestureDetector(
                  onTap: handleNext,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    decoration: BoxDecoration(
                      gradient: kAccentGradient,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: kAccentBlue.withOpacity(0.45),
                          blurRadius: 22,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isLast ? 'Get Started' : 'Continue',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const OnboardingDotIndicators(),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: kBgMid,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(Icons.arrow_back_rounded, size: 22, color: kTextSub),
      ),
    );
  }
}
