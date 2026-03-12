import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'register_input_field.dart';
import 'register_social_buttons.dart';

class RegisterFormCard extends HookConsumerWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onSubmit;
  final VoidCallback onLoginTap;
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  const RegisterFormCard({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.isLoading,
    this.errorMessage,
    required this.onSubmit,
    required this.onLoginTap,
    this.onGoogleTap,
    this.onAppleTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hidePassword = useState(true);
    final hideConfirm = useState(true);

    final confirmText = useState('');

    final confirmState = confirmText.value.isEmpty
        ? ConfirmFieldState.idle
        : confirmText.value == passwordController.text
            ? ConfirmFieldState.match
            : ConfirmFieldState.mismatch;

    useEffect(() {
      void listener() => confirmText.value = confirmPasswordController.text;
      confirmPasswordController.addListener(listener);
      return () => confirmPasswordController.removeListener(listener);
    }, [confirmPasswordController]);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F10),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.01),
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(28),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterInputField(
              label: 'Full Name',
              placeholder: 'Pranav Sharma',
              prefixIcon: Icons.person_outline_rounded,
              controller: fullNameController,
              validator: (v) {
                if (v == null || v.isEmpty)
                  return 'Please enter your full name';
                return null;
              },
            ),
            const SizedBox(height: 20),
            RegisterInputField(
              label: 'Email',
              placeholder: 'you@example.com',
              prefixIcon: Icons.mail_outline_rounded,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Please enter your email';
                if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                    .hasMatch(v)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            RegisterInputField(
              label: 'Password',
              placeholder: '••••••••',
              prefixIcon: Icons.lock_outline_rounded,
              controller: passwordController,
              obscureText: hidePassword.value,
              showVisibilityToggle: true,
              onToggleVisibility: () =>
                  hidePassword.value = !hidePassword.value,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Please enter your password';
                if (v.length < 6)
                  return 'Password must be at least 6 characters';
                return null;
              },
            ),
            const SizedBox(height: 20),
            RegisterInputField(
              label: 'Confirm Password',
              placeholder: '••••••••',
              prefixIcon: Icons.lock_outline_rounded,
              controller: confirmPasswordController,
              obscureText: hideConfirm.value,
              showVisibilityToggle: true,
              confirmState: confirmState,
              onToggleVisibility: () => hideConfirm.value = !hideConfirm.value,
              validator: (v) {
                if (v == null || v.isEmpty)
                  return 'Please confirm your password';
                if (v != passwordController.text)
                  return 'Passwords do not match';
                return null;
              },
            ),
            const SizedBox(height: 16),
            if (errorMessage != null && errorMessage!.isNotEmpty)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: const Color(0xFFEF4444).withValues(alpha: 0.3)),
                ),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(
                    color: Color(0xFFF87171),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            _CreateAccountButton(isLoading: isLoading, onTap: onSubmit),
            const SizedBox(height: 24),
            RegisterSocialButtons(
              onGoogleTap: onGoogleTap,
              onAppleTap: onAppleTap,
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 13.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: onLoginTap,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFFF87171),
                        fontWeight: FontWeight.w900,
                        fontSize: 13.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Center(
              child: Text(
                'By signing up, you agree to our Terms of Service and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.25),
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;

  const _CreateAccountButton({required this.isLoading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF3730A3), // indigo-800
              Color(0xFF4338CA), // indigo-700
              Color(0xFF6D28D9), // violet-700
              Color(0xFF1E1B4B), // indigo-950
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6D28D9).withValues(alpha: 0.4),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.3,
                  ),
                ),
        ),
      ),
    );
  }
}
