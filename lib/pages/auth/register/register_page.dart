import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/components/toast/toast.dart';
import 'package:intake_helper/pages/auth/register/widgets/register_form_card.dart';
import 'package:intake_helper/pages/auth/register/widgets/register_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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

    ref.listen<AsyncValue<ApiState>>(apiServiceProvider, (previous, next) {
      // Guard: skip if value is null or loading
      final value = next.value;
      if (value == null) return;

      if (value.message?.isNotEmpty ?? false) {
        showToast(value.message!, context, 1);
      }

      if (value.errorMessage?.isNotEmpty ?? false) {
        showToast(value.errorMessage!, context, 2);
      }

      if (value.redirect != null) {
        context.goNamed(value.redirect!, extra: emailController.text.trim());
      }
    });

    Future<void> handleRegister() async {
      errorMessage.value = '';

      final form = formKey.currentState;
      if (form == null || !form.validate()) return;
      form.save();

      isLoading.value = true;
      try {
        await ref.read(apiServiceProvider.notifier).registerUser(
              fullNameController.text.trim(),
              emailController.text.trim(),
              passwordController.text.trim(),
            );

        isLoading.value = false;
      } catch (_) {
        isLoading.value = false;
        errorMessage.value = 'Something went wrong. Please try again.';
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
          key: UniqueKey(),
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
