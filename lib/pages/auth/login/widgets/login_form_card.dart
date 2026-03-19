import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/components/custom_submit_button.dart';
import 'package:intake_helper/router.dart';

import 'login_input_field.dart';

class LoginFormCard extends HookConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onSubmit;
  final VoidCallback onRegisterTap;
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  const LoginFormCard({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.isLoading,
    this.errorMessage,
    required this.onSubmit,
    required this.onRegisterTap,
    this.onGoogleTap,
    this.onAppleTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hidePassword = useState(true);

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
            // Email field
            LoginInputField(
              label: 'Email',
              placeholder: 'you@example.com',
              prefixIcon: Icons.mail_outline_rounded,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Password field
            LoginInputField(
              label: 'Password',
              placeholder: '••••••••',
              prefixIcon: Icons.lock_outline_rounded,
              controller: passwordController,
              obscureText: hidePassword.value,
              showVisibilityToggle: true,
              onToggleVisibility: () =>
                  hidePassword.value = !hidePassword.value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            GestureDetector(
              onTap: () {
                context.push(RouteConstants.forgotPassword.path);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blueAccent,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 2.0),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Error message
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

            CustomSubmitButton(
                isLoading: isLoading, onTap: onSubmit, text: "Sign In"),
            // const SizedBox(height: 24),

            // SocialLoginButtons(
            //   onGoogleTap: onGoogleTap,
            //   onAppleTap: onAppleTap,
            // ),
            const SizedBox(height: 20),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 13.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: onRegisterTap,
                    child: const Text(
                      'Register',
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
          ],
        ),
      ),
    );
  }
}
