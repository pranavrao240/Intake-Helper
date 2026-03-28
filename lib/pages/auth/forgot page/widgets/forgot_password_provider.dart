import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/pages/auth/forgot%20page/widgets/forgot_password_model.dart';
import 'package:intake_helper/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  final BuildContext context;
  ForgotPasswordNotifier(this.context) : super(const ForgotPasswordState());

  Future<void> submitEmail(String email) async {
    final locale = AppLocalizations.of(context)!;
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
        errorMessage: locale.forgotPasswordProviderError,
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
  (ref) =>
      ForgotPasswordNotifier(ref.read(navigatorKeyProvider).currentContext!),
);

final navigatorKeyProvider = Provider((ref) => GlobalKey<NavigatorState>());
