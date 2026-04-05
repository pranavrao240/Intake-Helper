import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/on%20boarding/widgets/onboarding_model.dart';

/// Image card styled like the meal card in the app:
/// dark rounded container, image fills top portion, icon badge top-right.
class OnboardingImageCard extends HookConsumerWidget {
  const OnboardingImageCard({super.key, required this.step});

  final OnboardingStep step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 290,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBgBase,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: kBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: kAccentBlue.withOpacity(0.12),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Hero image
            Image.network(
              step.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, progress) {
                if (progress == null) return child;
                return Container(
                  color: kBgMid,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    value: progress.expectedTotalBytes != null
                        ? progress.cumulativeBytesLoaded /
                            progress.expectedTotalBytes!
                        : null,
                    color: kAccentBlue,
                    strokeWidth: 2,
                  ),
                );
              },
            ),

            // Dark gradient overlay from bottom (like meal card)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      kBgDeep.withOpacity(0.55),
                    ],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
            ),

            // Icon badge — top right (matches meal card heart badge position)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kBgMid.withOpacity(0.85),
                  shape: BoxShape.circle,
                  border: Border.all(color: kBorder),
                  boxShadow: [
                    BoxShadow(
                      color: kAccentBlue.withOpacity(0.35),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Icon(step.icon, size: 22, color: kAccentBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
