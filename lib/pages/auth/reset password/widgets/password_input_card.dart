
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/components/toast/toast.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/reset_password_model.dart';
import 'package:intake_helper/theme/app_tokens.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/reset_password_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class PasswordInputCard extends HookConsumerWidget {
  const PasswordInputCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordProvider);
    final notifier = ref.read(resetPasswordProvider.notifier);
    final passwordController = useTextEditingController();
    final cnfPasswordController = useTextEditingController();
    final locale = AppLocalizations.of(context)!;

    final shakeCtrl = useAnimationController(
      duration: const Duration(milliseconds: 380),
    );
    final shakeX = useAnimation(
      TweenSequence([
        TweenSequenceItem(tween: Tween<double>(begin: 0, end: -9), weight: 1),
        TweenSequenceItem(tween: Tween<double>(begin: -9, end: 9), weight: 2),
        TweenSequenceItem(tween: Tween<double>(begin: 9, end: -7), weight: 2),
        TweenSequenceItem(tween: Tween<double>(begin: -7, end: 0), weight: 1),
      ]).animate(shakeCtrl),
    );

    ref.listen<AsyncValue<ApiState>>(apiServiceProvider, (previous, next) {
      final value = next.value;
      if (value == null) return;

      if (!context.mounted) return;

      if (value.message?.isNotEmpty ?? false) {
        showToast(value.message!, context, 1);
        ref.read(resetPasswordProvider.notifier).setisSuccess();
      }

      if (value.errorMessage?.isNotEmpty ?? false) {
        showToast(value.errorMessage!, context, 2);
      }

      if (value.redirect != null) {
        context.goNamed(value.redirect!);
      }
    });

    useEffect(() {
      if (state.isError) shakeCtrl.forward(from: 0);
      return null;
    }, [state.isError]);

    return Transform.translate(
      offset: Offset(shakeX, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _FieldLabel(text: locale.passwordInputCardNewPassword),
          const SizedBox(height: 8),
          _PasswordField(
            hint: locale.passwordInputCardEnterNewPassword,
            onChanged: notifier.updatePassword,
            controller: passwordController,
            enabled: !state.isSubmitting,
          ),
          if (state.password.isNotEmpty) ...[
            const SizedBox(height: 14),
            _StrengthBar(score: state.strengthScore(context)),
            const SizedBox(height: 12),
            _RequirementsPanel(password: state.password),
          ],
          const SizedBox(height: 20),
          _FieldLabel(text: locale.passwordInputCardConfirmPassword),
          const SizedBox(height: 8),
          _PasswordField(
            hint: locale.passwordInputCardReEnterNewPassword,
            onChanged: notifier.updateConfirmPassword,
            controller: cnfPasswordController,
            enabled: !state.isSubmitting,
            matchState:
                state.confirmPassword.isEmpty ? null : state.passwordsMatch,
          ),
          if (state.confirmPassword.isNotEmpty) ...[
            const SizedBox(height: 8),
            _MatchFeedback(matches: state.passwordsMatch),
          ],
          if (state.isError && state.errorMessage != null) ...[
            const SizedBox(height: 12),
            _ErrorBanner(message: state.errorMessage!),
          ],
          const SizedBox(height: 28),
          _ResetButton(
            canSubmit: state.canSubmit(context),
            isLoading: state.isSubmitting,
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              print("Submit button tapped ${passwordController.text}");
              await ref.read(apiServiceProvider.notifier).resetPassword(
                  prefs.getString('emailVerificationToken') ?? '',
                  passwordController.text);
            },
          ),
          const SizedBox(height: 20),
          const _SecurityTip(),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel({required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppTokens.textLabel,
          letterSpacing: 1.2,
        ),
      );
}

class _PasswordField extends HookWidget {
  final String hint;
  final ValueChanged<String> onChanged;
  final bool enabled;
  final TextEditingController? controller;
  final bool? matchState; // null=neutral, true=match, false=mismatch

  const _PasswordField({
    required this.hint,
    required this.onChanged,
    required this.enabled,
    required this.controller,
    this.matchState,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final isFocused = useState(false);
    final isObscure = useState(true);

    useEffect(() {
      void h() => isFocused.value = focusNode.hasFocus;
      focusNode.addListener(h);
      return () => focusNode.removeListener(h);
    }, [focusNode]);

    Color borderColor() {
      if (matchState == true) return Colors.green.withOpacity(0.55);
      if (matchState == false) return AppTokens.red.withOpacity(0.5);
      if (isFocused.value) return AppTokens.btnLeft.withOpacity(0.7);
      return AppTokens.bgInputBorder;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppTokens.bgInput,
        borderRadius: BorderRadius.circular(AppTokens.radiusInput),
        border: Border.all(
            color: borderColor(), width: isFocused.value ? 1.8 : 1.2),
        boxShadow: isFocused.value
            ? [
                BoxShadow(
                    color: AppTokens.btnLeft.withOpacity(0.16),
                    blurRadius: 14,
                    offset: const Offset(0, 4))
              ]
            : null,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        enabled: enabled,
        obscureText: isObscure.value,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(color: Colors.white54),
            prefixIcon:
                const Icon(Icons.lock_outline_rounded, color: Colors.white54),
            suffixIcon: GestureDetector(
              onTap: () => isObscure.value = !isObscure.value,
              child: Icon(
                isObscure.value ? Icons.visibility_off : Icons.visibility,
                color: Colors.white54,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AppTokens.bgInput),
      ),
    );
  }
}

class _StrengthBar extends HookWidget {
  final int score; // 0–5
  const _StrengthBar({required this.score});

  Color get _color {
    if (score <= 1) return const Color(0xFFEF4444);
    if (score <= 2) return const Color(0xFFF97316);
    if (score <= 3) return const Color(0xFFEAB308);
    if (score <= 4) return const Color(0xFF84CC16);
    return Colors.green;
  }

  String _label(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    if (score <= 1) return locale.passwordStrengthVeryWeak;
    if (score <= 2) return locale.passwordStrengthWeak;
    if (score <= 3) return locale.passwordStrengthFair;
    if (score <= 4) return locale.passwordStrengthStrong;
    return locale.passwordStrengthVeryStrong;
  }

  @override
  Widget build(BuildContext context) {
    final animCtrl = useAnimationController(
      duration: const Duration(milliseconds: 400),
      initialValue: score / 5,
    );
    useEffect(() {
      animCtrl.animateTo(score / 5,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic);
      return null;
    }, [score]);
    final width = useAnimation(animCtrl);
    final locale = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(locale.passwordInputCardStrength,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppTokens.textLabel,
                    letterSpacing: 1.0)),
            const Spacer(),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600, color: _color),
              child: Text(_label(context)),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 5,
          decoration: BoxDecoration(
            color: AppTokens.bgInputBorder,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: MediaQuery.of(context).size.width * width * 0.82,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                      color: _color.withOpacity(0.4),
                      blurRadius: 6,
                      offset: const Offset(0, 1)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RequirementsPanel extends HookConsumerWidget {
  final String password;
  const _RequirementsPanel({required this.password});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTokens.bgInput,
        borderRadius: BorderRadius.circular(AppTokens.radiusInput),
        border: Border.all(color: AppTokens.bgInputBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locale.passwordInputCardRequirements,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppTokens.textLabel,
                letterSpacing: 1.0),
          ),
          const SizedBox(height: 10),
          ...ResetPasswordState.requirements(context).map((req) =>
              _RequirementRow(label: req.label, met: req.check(password))),
        ],
      ),
    );
  }
}

class _RequirementRow extends HookWidget {
  final String label;
  final bool met;
  const _RequirementRow({required this.label, required this.met});

  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 300),
      initialValue: met ? 1.0 : 0.0,
    );
    useEffect(() {
      if (met)
        ctrl.forward();
      else
        ctrl.reverse();
      return null;
    }, [met]);
    final scale = useAnimation(
      CurvedAnimation(parent: ctrl, curve: Curves.elasticOut),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Transform.scale(
            scale: 0.7 + scale * 0.3,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: met
                    ? Colors.green.withOpacity(0.15)
                    : AppTokens.bgInputBorder,
                border: Border.all(
                  color: met ? Colors.green : AppTokens.bgInputBorder,
                  width: 1.5,
                ),
              ),
              child: met
                  ? const Icon(Icons.check_rounded,
                      size: 11, color: Colors.greenAccent)
                  : null,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: met ? Colors.greenAccent : AppTokens.textSecondary,
              fontWeight: met ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _MatchFeedback extends HookWidget {
  final bool matches;
  const _MatchFeedback({required this.matches});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 280),
    );
    useEffect(() {
      ctrl.forward(from: 0);
      return null;
    }, [matches]);
    final fade = useAnimation(ctrl);
    final slide = useAnimation(
      Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
          .animate(CurvedAnimation(parent: ctrl, curve: Curves.easeOut)),
    );

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: SlideTransition(
        position: AlwaysStoppedAnimation(slide),
        child: Row(
          children: [
            Icon(
              matches ? Icons.check_circle_rounded : Icons.cancel_rounded,
              size: 14,
              color: matches ? Colors.greenAccent : AppTokens.red,
            ),
            const SizedBox(width: 6),
            Text(
              matches
                  ? locale.passwordInputCardPasswordsMatch
                  : locale.passwordInputCardPasswordsDoNotMatch,
              style: TextStyle(
                fontSize: 12,
                color: matches ? Colors.greenAccent : AppTokens.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResetButton extends HookConsumerWidget {
  final bool canSubmit;
  final bool isLoading;
  final VoidCallback onTap;
  const _ResetButton({
    required this.canSubmit,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = AppLocalizations.of(context)!;
    final isPressed = useState(false);
    final shimCtrl = useAnimationController(
      duration: const Duration(milliseconds: 1800),
    )..repeat();
    final shimAnim = useAnimation(shimCtrl);

    final active = canSubmit && !isLoading;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: isPressed.value ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 110),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 58,
          decoration: BoxDecoration(
            gradient: active
                ? const LinearGradient(
                    colors: [AppTokens.btnLeft, AppTokens.btnRight],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)
                : null,
            color: active ? null : AppTokens.bgInputBorder,
            borderRadius: BorderRadius.circular(AppTokens.radiusBtn),
            boxShadow: active
                ? [
                    BoxShadow(
                        color: AppTokens.btnLeft
                            .withValues(alpha: isPressed.value ? 0.2 : 0.42),
                        blurRadius: isPressed.value ? 8 : 24,
                        offset: const Offset(0, 8))
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTokens.radiusBtn),
            child: Stack(
              children: [
                if (active && !isLoading)
                  Positioned.fill(
                    child: Transform.translate(
                      offset: Offset((shimAnim * 2 - 0.5) * 420, 0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.white.withValues(alpha: 0),
                            Colors.white.withValues(alpha: 0.11),
                            Colors.white.withValues(alpha: 0),
                          ]),
                        ),
                      ),
                    ),
                  ),
                Center(
                  child: isLoading
                      ? const _LoadingDots()
                      : Text(
                          locale.passwordInputCardResetPassword,
                          style: TextStyle(
                            color: active ? Colors.white : AppTokens.textMuted,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingDots extends HookWidget {
  const _LoadingDots();
  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 800),
    )..repeat();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        final a = useAnimation(
          Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
              parent: ctrl,
              curve:
                  Interval(i * 0.2, 0.6 + i * 0.2, curve: Curves.easeInOut))),
        );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Transform.translate(
            offset: Offset(0, -6 * a),
            child: Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        );
      }),
    );
  }
}

class _SecurityTip extends StatelessWidget {
  const _SecurityTip();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppTokens.bgInput,
        borderRadius: BorderRadius.circular(AppTokens.radiusInput),
        border: Border.all(color: AppTokens.bgInputBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppTokens.btnLeft.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                const Center(child: Text('🔒', style: TextStyle(fontSize: 16))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              locale.passwordInputCardSecurityTip,
              style: const TextStyle(
                  fontSize: 13, color: AppTokens.textSecondary, height: 1.45),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends HookWidget {
  final String message;
  const _ErrorBanner({required this.message});

  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    useEffect(() {
      ctrl.forward();
      return null;
    }, const []);
    final fade = useAnimation(ctrl);
    final slide = useAnimation(
      Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
          .animate(CurvedAnimation(parent: ctrl, curve: Curves.easeOut)),
    );
    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: SlideTransition(
        position: AlwaysStoppedAnimation(slide),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          decoration: BoxDecoration(
            color: AppTokens.red.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTokens.red.withValues(alpha: 0.35)),
          ),
          child: Row(
            children: [
              Icon(Icons.error_outline_rounded,
                  size: 16, color: AppTokens.red.withValues(alpha: 0.85)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTokens.red.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
