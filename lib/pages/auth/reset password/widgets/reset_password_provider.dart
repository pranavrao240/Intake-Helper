import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/reset_password_model.dart';
import 'package:intake_helper/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final BuildContext context;
  ResetPasswordNotifier(this.context) : super(const ResetPasswordState());

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
    final locale = AppLocalizations.of(context)!;
    if (!state.canSubmit(context)) return;

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
        errorMessage: locale.resetPasswordProviderError,
      );
    }
  }

  void reset() => state = const ResetPasswordState();
}

final resetPasswordProvider = StateNotifierProvider.autoDispose<
    ResetPasswordNotifier, ResetPasswordState>(
  (ref) =>
      ResetPasswordNotifier(ref.read(navigatorKeyProvider).currentContext!),
);

final navigatorKeyProvider = Provider((ref) => GlobalKey<NavigatorState>());
