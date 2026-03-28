import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Providers/onboarding_provider.dart';
import '../onboarding_page.dart';

/// Mirrors React's <OnboardingWrapper>.
///
/// - null  → loading spinner
/// - false → show [OnboardingPage]
/// - true  → show [child] (the real app)
class OnboardingWrapper extends HookConsumerWidget {
  const OnboardingWrapper({super.key, required this.child});

  /// The real home screen shown after onboarding is complete.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSeen = ref.watch(onboardingProvider);

    // Loading state
    if (hasSeen == null) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  color: Color(0xFFE31E24),
                  strokeWidth: 3.5,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Loading...',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Show onboarding or the app
    return hasSeen ? child : const OnboardingPage();
  }
}
