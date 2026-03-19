import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/password_input_card.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/reset_password_header.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/reset_password_provider.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/success_card.dart';
import 'package:intake_helper/theme/app_tokens.dart';

class ResetPasswordPage extends HookConsumerWidget {
  final VoidCallback? onContinue;

  const ResetPasswordPage({super.key, this.onContinue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final masterCtrl = useAnimationController(
      duration: const Duration(milliseconds: 1400),
    );

    useEffect(() {
      masterCtrl.forward();
      return null;
    }, const []);

    return Scaffold(
      backgroundColor: AppTokens.bgBase,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.46,
            child: Stack(
              children: [
                const ResetPasswordHeader(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 12),
                    child: _FadeIn(
                        ctrl: masterCtrl,
                        start: 0.0,
                        end: 0.25,
                        child: _BackButton()),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _BottomCard(masterCtrl: masterCtrl, onContinue: onContinue),
          ),
        ],
      ),
    );
  }
}

class _BottomCard extends HookConsumerWidget {
  final AnimationController masterCtrl;
  final VoidCallback? onContinue;

  const _BottomCard({required this.masterCtrl, required this.onContinue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordProvider);

    final cardFade = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: masterCtrl,
            curve: const Interval(0.2, 0.6, curve: Curves.easeOut)),
      ),
    );
    final cardSlide = useAnimation(
      Tween<Offset>(begin: const Offset(0, 0.14), end: Offset.zero).animate(
        CurvedAnimation(
            parent: masterCtrl,
            curve: const Interval(0.2, 0.65, curve: Curves.easeOutCubic)),
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
                        begin: const Offset(0, 0.1),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                          parent: anim, curve: Curves.easeOutCubic)),
                      child: child,
                    ),
                  ),
                  child: state.isSuccess
                      ? SuccessCard(
                          key: const ValueKey('success'),
                          onContinue: onContinue,
                        )
                      : const PasswordInputCard(key: ValueKey('form')),
                ),

                // Bottom safe-area padding
                SizedBox(height: MediaQuery.of(context).padding.bottom + 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);
    return GestureDetector(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) {
        isPressed.value = false;
        context.pop();
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

class _FadeIn extends HookWidget {
  final AnimationController ctrl;
  final double start, end;
  final Widget child;
  const _FadeIn({
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
            parent: ctrl, curve: Interval(start, end, curve: Curves.easeOut)),
      ),
    );
    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: child,
    );
  }
}
