import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intake_helper/pages/auth/login/widgets/login_form_card.dart';
import 'package:intake_helper/pages/auth/login/widgets/login_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/router.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
    final errorMessage = useState('');
    final locale = AppLocalizations.of(context)!;

    ref.listen<AsyncValue<ApiState>>(apiServiceProvider, (previous, next) {
      final value = next.value;
      if (value == null) return;

      if (value.redirect != null) {
        context.goNamed(value.redirect!);
      }
    });

    Future<void> handleSignIn() async {
      errorMessage.value = '';

      final form = formKey.currentState;
      if (form == null || !form.validate()) {
        errorMessage.value = locale.loginPageFillAllFields;
        return;
      }
      form.save();

      isLoading.value = true;
      try {
        final success = await ref.read(apiServiceProvider.notifier).loginUser(
              emailController.text.trim(),
              passwordController.text.trim(),
            );

        isLoading.value = false;

        if (success) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_email', emailController.text.trim());
        } else {
          errorMessage.value = locale.loginPageInvalidCredentials;
        }
      } catch (_) {
        isLoading.value = false;
        errorMessage.value = locale.loginPageGenericError;
      }
    }

    void handleRegisterTap() {
      context.push(RouteConstants.register.path);
    }

    void handleGoogleLogin() {
      // TODO: integrate Google OAuth
    }

    void handleAppleLogin() {
      // TODO: integrate Apple Sign-In
    }

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ModalProgressHUD(
          inAsyncCall: isLoading.value,
          opacity: 0.3,
          key: UniqueKey(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginHeader(),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LoginFormCard(
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: formKey,
                      isLoading: isLoading.value,
                      errorMessage: errorMessage.value.isEmpty
                          ? null
                          : errorMessage.value,
                      onSubmit: handleSignIn,
                      onRegisterTap: handleRegisterTap,
                      onGoogleTap: handleGoogleLogin,
                      onAppleTap: handleAppleLogin,
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
