import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ---------- Onboarding seen state ----------

class OnboardingNotifier extends Notifier<bool?> {
  static const _key = 'hasSeenOnboarding';

  @override
  bool? build() {
    _init();
    return null; // null = loading
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_key) ?? false;
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
    state = true;
  }

  Future<void> resetOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
    state = false;
  }
}

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, bool?>(OnboardingNotifier.new);

// ---------- Current step state ----------

class OnboardingStepNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void next(int total) {
    if (state < total - 1) state = state + 1;
  }

  void prev() {
    if (state > 0) state = state - 1;
  }

  void goTo(int index) => state = index;

  void reset() => state = 0;
}

final onboardingStepProvider =
    NotifierProvider<OnboardingStepNotifier, int>(OnboardingStepNotifier.new);

// ---------- Slide direction state ----------

// 1 = forward, -1 = backward
final slideDirectionProvider = StateProvider<int>((ref) => 1);
