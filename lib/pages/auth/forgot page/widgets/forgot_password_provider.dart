import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/pages/auth/forgot%20page/widgets/forgot_password_model.dart';

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  ForgotPasswordNotifier() : super(const ForgotPasswordState());

  Future<void> submitEmail(String email) async {
    if (email.trim().isEmpty) return;

    state = state.copyWith(
      email: email.trim(),
      status: ForgotPasswordStatus.submitting,
      clearError: true,
    );

    try {
      await Future.delayed(const Duration(milliseconds: 1500));

      state = state.copyWith(status: ForgotPasswordStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: ForgotPasswordStatus.error,
        errorMessage: 'Something went wrong. Please try again.',
      );
    }
  }

  void reset() {
    state = const ForgotPasswordState();
  }

  void tryAnotherEmail() {
    state = state.copyWith(
      status: ForgotPasswordStatus.idle,
      clearError: true,
    );
  }
}

final forgotPasswordProvider = StateNotifierProvider.autoDispose<
    ForgotPasswordNotifier, ForgotPasswordState>(
  (ref) => ForgotPasswordNotifier(),
);
