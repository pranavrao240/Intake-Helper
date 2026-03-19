import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/reset_password_model.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordNotifier() : super(const ResetPasswordState());

  void updatePassword(String value) {
    state = state.copyWith(password: value, clearError: true);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value, clearError: true);
  }

  void setisSuccess() {
    state = state.copyWith(
      status: ResetPasswordStatus.success,
      clearError: true,
    );
  }

  Future<void> submit() async {
    if (!state.canSubmit) return;

    state = state.copyWith(
      status: ResetPasswordStatus.submitting,
      clearError: true,
    );

    try {
      await Future.delayed(const Duration(milliseconds: 1600));

      state = state.copyWith(status: ResetPasswordStatus.success);
    } catch (e) {
      state = state.copyWith(
        status: ResetPasswordStatus.error,
        errorMessage: 'Failed to reset password. Please try again.',
      );
    }
  }

  void reset() => state = const ResetPasswordState();
}

final resetPasswordProvider = StateNotifierProvider.autoDispose<
    ResetPasswordNotifier, ResetPasswordState>(
  (ref) => ResetPasswordNotifier(),
);
