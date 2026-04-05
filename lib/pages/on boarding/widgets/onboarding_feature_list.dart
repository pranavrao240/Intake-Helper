import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/on%20boarding/widgets/onboarding_model.dart';

// kBgCard, kBorder, kAccentGradient, kAccentBlue, kTextSub all live in onboarding_model.dart

/// Animated list of feature chips. Each row slides in from the left with a stagger.
class OnboardingFeatureList extends HookConsumerWidget {
  const OnboardingFeatureList({super.key, required this.step});

  final OnboardingStep step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Re-run animations whenever the step object changes (key trick on parent
    // means this widget is recreated, so AnimationControllers reset automatically).
    final controllers = List.generate(
      step.features.length,
      (i) => useAnimationController(
        duration: const Duration(milliseconds: 400),
      ),
    );

    final animations = List.generate(
      step.features.length,
      (i) => CurvedAnimation(parent: controllers[i], curve: Curves.easeOut),
    );

    useEffect(() {
      for (var i = 0; i < controllers.length; i++) {
        Future.delayed(Duration(milliseconds: 100 * i), () {
          if (controllers[i].status != AnimationStatus.completed) {
            controllers[i].forward();
          }
        });
      }
      return null;
    }, []);

    return Column(
      children: List.generate(step.features.length, (i) {
        return AnimatedBuilder(
          animation: animations[i],
          builder: (_, __) => Opacity(
            opacity: animations[i].value,
            child: Transform.translate(
              offset: Offset(-20 * (1 - animations[i].value), 0),
              child: _FeatureRow(text: step.features[i]),
            ),
          ),
        );
      }),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: kBgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kBorder),
        boxShadow: [
          BoxShadow(
            color: kAccentBlue.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Glowing indigo check badge
          Container(
            margin: const EdgeInsets.only(top: 1),
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: kAccentGradient,
              boxShadow: [
                BoxShadow(
                  color: kAccentBlue.withOpacity(0.45),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: kTextSub,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
