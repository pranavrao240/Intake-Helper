import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/auth/forgot%20page/widgets/forgot_password_provider.dart';
import 'package:intake_helper/theme/app_tokens.dart';

class SuccessInfoCard extends HookConsumerWidget {
  const SuccessInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(forgotPasswordProvider);

    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    useEffect(() {
      ctrl.forward();
      return null;
    }, const []);
    final fade = useAnimation(ctrl);
    final slide = useAnimation(
      Tween<Offset>(begin: const Offset(0, 0.18), end: Offset.zero).animate(
        CurvedAnimation(parent: ctrl, curve: Curves.easeOutCubic),
      ),
    );

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: SlideTransition(
        position: AlwaysStoppedAnimation(slide),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SentToField(email: state.email),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTokens.bgInput,
                borderRadius: BorderRadius.circular(AppTokens.radiusInput),
                border: Border.all(color: AppTokens.bgInputBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppTokens.btnLeft.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.mail_outline_rounded,
                          color: AppTokens.orbPurple,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "What's next?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppTokens.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ..._steps.map((s) => _StepRow(icon: s.$1, label: s.$2)),
                ],
              ),
            ),
            const SizedBox(height: 28),
            _BackToLoginButton(),
          ],
        ),
      ),
    );
  }
}

const _steps = [
  (Icons.inbox_outlined, 'Check your inbox and spam folder'),
  (Icons.touch_app_outlined, 'Click the reset link in the email'),
  (Icons.lock_reset_outlined, 'Create a new secure password'),
];

class _SentToField extends HookWidget {
  final String email;
  const _SentToField({required this.email});

  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), ctrl.forward);
      return null;
    }, const []);
    final scale = useAnimation(
      CurvedAnimation(parent: ctrl, curve: Curves.elasticOut),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'EMAIL',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppTokens.textLabel,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: AppTokens.bgInput,
            borderRadius: BorderRadius.circular(AppTokens.radiusInput),
            border: Border.all(
              color: const Color(0xFF22C55E).withValues(alpha: 0.45),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF22C55E).withValues(alpha: 0.07),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.mail_outline_rounded,
                  color: AppTokens.textSecondary, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  email,
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppTokens.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Transform.scale(
                scale: 0.5 + scale * 0.5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0xFF22C55E).withValues(alpha: 0.4),
                    ),
                  ),
                  child: const Text(
                    'Sent ✓',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4ADE80),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StepRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StepRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
              color: AppTokens.orbPurple,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppTokens.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackToLoginButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = useState(false);
    final shimCtrl = useAnimationController(
      duration: const Duration(milliseconds: 1800),
    )..repeat();
    final shimAnim = useAnimation(shimCtrl);

    return GestureDetector(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) {
        isPressed.value = false;
        context.pop();
      },
      onTapCancel: () => isPressed.value = false,
      child: AnimatedScale(
        scale: isPressed.value ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 110),
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTokens.btnLeft, AppTokens.btnRight],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(AppTokens.radiusBtn),
            boxShadow: [
              BoxShadow(
                color: AppTokens.btnLeft.withValues(
                  alpha: isPressed.value ? 0.2 : 0.45,
                ),
                blurRadius: isPressed.value ? 8 : 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTokens.radiusBtn),
            child: Stack(
              children: [
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
                const Center(
                  child: Text(
                    'Back to Login',
                    style: TextStyle(
                      color: Colors.white,
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
