enum ForgotPasswordStatus { idle, submitting, success, error }

class ForgotPasswordState {
  final String email;
  final ForgotPasswordStatus status;
  final String? errorMessage;

  const ForgotPasswordState({
    this.email = '',
    this.status = ForgotPasswordStatus.idle,
    this.errorMessage,
  });

  bool get isSubmitting => status == ForgotPasswordStatus.submitting;
  bool get isSuccess => status == ForgotPasswordStatus.success;
  bool get isError => status == ForgotPasswordStatus.error;
  bool get isIdle => status == ForgotPasswordStatus.idle;

  ForgotPasswordState copyWith({
    String? email,
    ForgotPasswordStatus? status,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
