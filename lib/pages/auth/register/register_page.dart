import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/components/toast/toast.dart';
import 'package:intake_helper/pages/auth/register/widgets/register_form_card.dart';
import 'package:intake_helper/pages/auth/register/widgets/register_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/router.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final fullNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isLoading = useState(false);
    final errorMessage = useState('');
    final locale = AppLocalizations.of(context)!;

    ref.listen<AsyncValue<ApiState>>(apiServiceProvider, (previous, next) {
      // Guard: skip if value is null or loading
      final value = next.value;
      if (value == null) return;

      if (value.message?.isNotEmpty ?? false) {
        if (context.mounted) {
          showToast(value.message!, context, 1);
        }
      }

      if (value.errorMessage?.isNotEmpty ?? false) {
        if (context.mounted) {
          showToast(value.errorMessage!, context, 2);
        }
      }

      if (value.redirect != null) {
        if (context.mounted) {
          context.goNamed(value.redirect!, extra: emailController.text.trim());
        }
      }
    });

    Future<void> handleRegister() async {
      errorMessage.value = '';

      final form = formKey.currentState;
      if (form == null || !form.validate()) return;

      try {
        form.save();
      } catch (e) {
        if (context.mounted) {
          errorMessage.value = 'Form validation error: $e';
        }
        return;
      }

      isLoading.value = true;
      try {
        final fullName = fullNameController.text.trim();
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
          if (context.mounted) {
            errorMessage.value = locale.loginPageFillAllFields;
            isLoading.value = false;
          }
          return;
        }

        await ref.read(apiServiceProvider.notifier).registerUser(
              fullName,
              email,
              password,
            );

        if (context.mounted) {
          isLoading.value = false;
        }
      } catch (e) {
        if (context.mounted) {
          isLoading.value = false;
          errorMessage.value = '${locale.registerPageGenericError}: $e';
        }
      }
    }

    void handleLoginTap() => context.go(RouteConstants.login.path);
    void handleGoogleTap() {/* TODO: Google OAuth */}
    void handleAppleTap() {/* TODO: Apple Sign-In */}

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ModalProgressHUD(
          inAsyncCall: isLoading.value,
          opacity: 0.3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const RegisterHeader(),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RegisterFormCard(
                      fullNameController: fullNameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      formKey: formKey,
                      isLoading: isLoading.value,
                      errorMessage: errorMessage.value.isEmpty
                          ? null
                          : errorMessage.value,
                      onSubmit: handleRegister,
                      onLoginTap: handleLoginTap,
                      onGoogleTap: handleGoogleTap,
                      onAppleTap: handleAppleTap,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
