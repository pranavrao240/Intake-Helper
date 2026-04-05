import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/components/custom_submit_button.dart';
import 'package:intake_helper/components/toast/toast.dart';
import 'package:intake_helper/pages/auth/forgot%20page/widgets/forgot_password_header.dart';
import 'package:intake_helper/pages/auth/forgot page/widgets/email_input_card.dart';
import 'package:intake_helper/pages/auth/forgot page/widgets/success_info_card.dart';
import 'package:intake_helper/pages/auth/forgot page/widgets/forgot_password_actions.dart';
import 'package:intake_helper/pages/auth/forgot%20page/widgets/forgot_password_provider.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/theme/app_tokens.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class ForgotPasswordPage extends HookConsumerWidget {
  final VoidCallback? onSignIn;
  const ForgotPasswordPage({super.key, this.onSignIn});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final masterCtrl = useAnimationController(
      duration: const Duration(milliseconds: 1400),
    );
    useEffect(() {
      masterCtrl.forward();
      return null;
    }, const []);

    ref.listen<AsyncValue<ApiState>>(apiServiceProvider, (previous, next) {
      final value = next.value;
      if (value == null) return;

      if (!context.mounted) return;

      if (value.message?.isNotEmpty ?? false) {
        showToast(value.message!, context, 1);
        // ref.read(apiServiceProvider.notifier).resetMessages();
      }

      if (value.errorMessage?.isNotEmpty ?? false) {
        showToast(value.errorMessage!, context, 2);
        // ref.read(apiServiceProvider.notifier).resetMessages();
      }

      if (value.redirect != null) {
        context.goNamed(value.redirect!);
        // ref.read(apiServiceProvider.notifier).resetMessages();
      }
    });

    return Scaffold(
      backgroundColor: AppTokens.bgBase,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.46,
            child: Stack(
              children: [
                const ForgotPasswordHeader(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 12),
                    child: _StaggerFade(
                      ctrl: masterCtrl,
                      start: 0.0,
                      end: 0.25,
                      child: ForgotBackButton(onTap: onSignIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _BottomCard(masterCtrl: masterCtrl, onSignIn: onSignIn),
          ),
        ],
      ),
    );
  }
}

class _BottomCard extends HookConsumerWidget {
  final AnimationController masterCtrl;
  final VoidCallback? onSignIn;

  const _BottomCard({
    required this.masterCtrl,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(forgotPasswordProvider);
    final emailController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final locale = AppLocalizations.of(context)!;

    final cardFade = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: masterCtrl,
          curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
        ),
      ),
    );
    final cardSlide = useAnimation(
      Tween<Offset>(begin: const Offset(0, 0.14), end: Offset.zero).animate(
        CurvedAnimation(
          parent: masterCtrl,
          curve: const Interval(0.2, 0.65, curve: Curves.easeOutCubic),
        ),
      ),
    );

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(cardFade),
      child: SlideTransition(
        position: AlwaysStoppedAnimation(cardSlide),
        child: Container(
          decoration: const BoxDecoration(
            color: AppTokens.bgCard,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppTokens.radiusCard),
              topRight: Radius.circular(AppTokens.radiusCard),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 420),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, anim) => FadeTransition(
                      opacity: anim,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.12),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(
                          parent: anim,
                          curve: Curves.easeOutCubic,
                        )),
                        child: child,
                      ),
                    ),
                    child: state.isSuccess
                        ? const SuccessInfoCard(key: ValueKey('success'))
                        : EmailInputField(
                            label: locale.emailInputCardEmailLabel,
                            placeholder: locale.emailInputCardEnterEmail,
                            prefixIcon: Icons.email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return locale.forgotPasswordEnterEmail;
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                  .hasMatch(value)) {
                                return locale.forgotPasswordInvalidEmail;
                              }
                              return null;
                            },
                            controller: emailController),
                  ),
                  const SizedBox(height: 20),
                  if (!state.isSuccess) ...[
                    const ForgotOrDivider(),
                    const SizedBox(height: 18),
                  ],
                  ForgotBottomLinks(onSignIn: onSignIn),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 24,
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: CustomSubmitButton(
                      isLoading:
                          ref.read(apiServiceProvider.notifier).state.isLoading,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await ref
                              .read(apiServiceProvider.notifier)
                              .sendForgotPasswordEmail(emailController.text)
                              .then((value) {
                            context.push(RouteConstants.resetPassword.path);
                          });
                        }
                      },
                      text: locale.forgotPasswordSendResetLink,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StaggerFade extends HookWidget {
  final AnimationController ctrl;
  final double start, end;
  final Widget child;
  const _StaggerFade({
    required this.ctrl,
    required this.start,
    required this.end,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final fade = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: ctrl,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      ),
    );
    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: child,
    );
  }
}
