import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/theme/app_tokens.dart';

class SuccessCard extends HookConsumerWidget {
  final VoidCallback? onContinue;
  const SuccessCard({super.key, this.onContinue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    useEffect(() {
      ctrl.forward();
      return null;
    }, const []);
    final fade = useAnimation(ctrl);
    final slide = useAnimation(
      Tween<Offset>(begin: const Offset(0, 0.18), end: Offset.zero)
          .animate(CurvedAnimation(parent: ctrl, curve: Curves.easeOutCubic)),
    );

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: SlideTransition(
        position: AlwaysStoppedAnimation(slide),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SecurityStatusTile(),
            const SizedBox(height: 16),
            _ProTipBanner(),
            const SizedBox(height: 28),
            _ContinueButton(onTap: () => context.go(RouteConstants.login.path)),
          ],
        ),
      ),
    );
  }
}

class _SecurityStatusTile extends HookWidget {
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

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTokens.bgInput,
        borderRadius: BorderRadius.circular(AppTokens.radiusInput),
        border: Border.all(color: AppTokens.bgInputBorder),
      ),
      child: Row(
        children: [
          Transform.scale(
            scale: 0.5 + scale * 0.5,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTokens.btnLeft, AppTokens.btnRight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: AppTokens.btnLeft.withValues(alpha: 0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 4)),
                ],
              ),
              child:
                  const Icon(Icons.lock_rounded, color: Colors.white, size: 22),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Security Status',
                style: TextStyle(fontSize: 12, color: AppTokens.textSecondary),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Text(
                    'Password Updated',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTokens.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProTipBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppTokens.radiusInput),
        border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Center(
              child: Text('💡', style: TextStyle(fontSize: 14)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                    fontSize: 13, color: AppTokens.textSecondary, height: 1.45),
                children: const [
                  TextSpan(
                    text: 'Pro tip: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.greenAccent),
                  ),
                  TextSpan(
                      text:
                          'Use a password manager to securely store your credentials.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContinueButton extends HookConsumerWidget {
  final VoidCallback? onTap;
  const _ContinueButton({required this.onTap});

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
        (onTap ?? () => context.pop())();
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
                  color: AppTokens.btnLeft
                      .withValues(alpha: isPressed.value ? 0.2 : 0.42),
                  blurRadius: isPressed.value ? 8 : 24,
                  offset: const Offset(0, 8)),
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
                    'Continue to Login',
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
