import 'package:flutter/material.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

enum ResetPasswordStatus { idle, submitting, success, error }

class PasswordRequirement {
  final String label;
  final bool Function(String) check;
  const PasswordRequirement({required this.label, required this.check});
}

class ResetPasswordState {
  final String password;
  final String confirmPassword;
  final ResetPasswordStatus status;
  final String? errorMessage;

  const ResetPasswordState({
    this.password = '',
    this.confirmPassword = '',
    this.status = ResetPasswordStatus.idle,
    this.errorMessage,
  });

  static List<PasswordRequirement> requirements(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return <PasswordRequirement>[
      PasswordRequirement(
          label: locale.passwordRequirementLength, check: (p) => p.length >= 8),
      PasswordRequirement(
          label: locale.passwordRequirementUppercase,
          check: (p) => RegExp(r'[A-Z]').hasMatch(p)),
      PasswordRequirement(
          label: locale.passwordRequirementLowercase,
          check: (p) => RegExp(r'[a-z]').hasMatch(p)),
      PasswordRequirement(
          label: locale.passwordRequirementNumber,
          check: (p) => RegExp(r'\d').hasMatch(p)),
      PasswordRequirement(
          label: locale.passwordRequirementSpecial,
          check: (p) => RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(p)),
    ];
  }

  bool allRequirementsMet(BuildContext context) =>
      requirements(context).every((r) => r.check(password));

  bool get passwordsMatch =>
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;

  bool canSubmit(BuildContext context) =>
      allRequirementsMet(context) && passwordsMatch;

  bool get isSubmitting => status == ResetPasswordStatus.submitting;
  bool get isSuccess => status == ResetPasswordStatus.success;
  bool get isError => status == ResetPasswordStatus.error;

  int strengthScore(BuildContext context) =>
      requirements(context).where((r) => r.check(password)).length;

  ResetPasswordState copyWith({
    String? password,
    String? confirmPassword,
    ResetPasswordStatus? status,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ResetPasswordState(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
