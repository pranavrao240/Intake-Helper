import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/auth/forgot%20page/widgets/forgot_password_provider.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/theme/app_tokens.dart';

class ForgotBackButton extends HookWidget {
  final VoidCallback? onTap;
  const ForgotBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    return GestureDetector(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) {
        isPressed.value = false;
        (onTap ?? () => Navigator.of(context).maybePop())();
      },
      onTapCancel: () => isPressed.value = false,
      child: AnimatedScale(
        scale: isPressed.value ? 0.90 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Icon(
            Icons.arrow_back_rounded,
            size: 20,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}

class ForgotBottomLinks extends HookConsumerWidget {
  final VoidCallback? onSignIn;
  const ForgotBottomLinks({super.key, this.onSignIn});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(forgotPasswordProvider);
    final notifier = ref.read(forgotPasswordProvider.notifier);

    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 300), ctrl.forward);
      return null;
    }, const []);
    final fade = useAnimation(ctrl);

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: Column(
        children: [
          if (state.isSuccess) ...[
            _LinkRow(
              prefix: '',
              label: 'Try another email',
              color: AppTokens.textSecondary,
              onTap: notifier.tryAnotherEmail,
            ),
            const SizedBox(height: 10),
          ],
          _LinkRow(
            prefix: 'Remember your password?  ',
            label: 'Sign in',
            color: AppTokens.red,
            fontWeight: FontWeight.w700,
            onTap: onSignIn ?? () => context.go(RouteConstants.login.path),
          ),
        ],
      ),
    );
  }
}

class _LinkRow extends HookWidget {
  final String prefix;
  final String label;
  final Color color;
  final FontWeight fontWeight;
  final VoidCallback onTap;

  const _LinkRow({
    required this.prefix,
    required this.label,
    required this.color,
    required this.onTap,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefix.isNotEmpty)
          Text(
            prefix,
            style: const TextStyle(
              fontSize: 13,
              color: AppTokens.textSecondary,
            ),
          ),
        GestureDetector(
          onTapDown: (_) => isPressed.value = true,
          onTapUp: (_) {
            isPressed.value = false;
            onTap();
          },
          onTapCancel: () => isPressed.value = false,
          child: AnimatedScale(
            scale: isPressed.value ? 0.93 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: fontWeight,
                color: isPressed.value ? color.withOpacity(0.65) : color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ForgotOrDivider extends StatelessWidget {
  const ForgotOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppTokens.bgInputBorder,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            'or continue with',
            style: const TextStyle(
              fontSize: 12,
              color: AppTokens.textMuted,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppTokens.bgInputBorder,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
