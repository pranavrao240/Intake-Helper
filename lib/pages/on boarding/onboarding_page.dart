import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/onboarding_provider.dart';
import 'package:intake_helper/pages/on%20boarding/widgets/onboarding_model.dart';

import '../../router.dart'; // markOnboardingSeen()
import 'widgets/onboarding_header.dart';
import 'widgets/onboarding_progress_bar.dart';
import 'widgets/onboarding_slide_content.dart';
import 'widgets/onboarding_bottom_bar.dart';

/// The main onboarding page — composes all sub-widgets.
/// Mirrors React's <OnboardingPage /> component.
class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepNotifier = ref.read(onboardingStepProvider.notifier);

    Future<void> complete() async {
      // 1. Persist the flag — the GoRouter redirect checks this on every navigation
      await markOnboardingSeen();

      // 2. Reset step so "View Tutorial" from profile starts fresh
      stepNotifier.reset();

      // 3. GoRouter re-runs the redirect which now sees onboardingDone == true
      if (context.mounted) context.go('/home');
    }

    return Scaffold(
      backgroundColor: kBgDeep,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E1B4B), // indigo-950
              Color(0xFF3730A3), // indigo-800
              Color(0xFF4338CA), // indigo-700
              Color(0xFF6D28D9), // violet-700
            ],
            stops: [0.0, 0.35, 0.65, 1.0],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header row
              OnboardingHeader(onSkip: complete),
              const SizedBox(height: 16),

              // Progress bar
              const OnboardingProgressBar(),
              const SizedBox(height: 24),

              // Scrollable slide content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: const [
                      OnboardingSlideContent(),
                      SizedBox(height: 180), // room above bottom bar
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: OnboardingBottomBar(onComplete: complete),
    );
  }
}
