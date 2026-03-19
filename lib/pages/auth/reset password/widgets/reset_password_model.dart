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

  static final requirements = <PasswordRequirement>[
    PasswordRequirement(
        label: 'At least 8 characters', check: (p) => p.length >= 8),
    PasswordRequirement(
        label: 'Contains uppercase letter',
        check: (p) => RegExp(r'[A-Z]').hasMatch(p)),
    PasswordRequirement(
        label: 'Contains lowercase letter',
        check: (p) => RegExp(r'[a-z]').hasMatch(p)),
    PasswordRequirement(
        label: 'Contains number', check: (p) => RegExp(r'\d').hasMatch(p)),
    PasswordRequirement(
        label: 'Contains special character',
        check: (p) => RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(p)),
  ];

  bool get allRequirementsMet => requirements.every((r) => r.check(password));

  bool get passwordsMatch =>
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;

  bool get canSubmit => allRequirementsMet && passwordsMatch;

  bool get isSubmitting => status == ResetPasswordStatus.submitting;
  bool get isSuccess => status == ResetPasswordStatus.success;
  bool get isError => status == ResetPasswordStatus.error;

  int get strengthScore => requirements.where((r) => r.check(password)).length;

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
