import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/pages/auth/reset%20password/widgets/reset_password_provider.dart';
import 'package:intake_helper/theme/app_tokens.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class ResetPasswordHeader extends HookConsumerWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetPasswordProvider);
    final locale = AppLocalizations.of(context)!;

    final entranceCtrl = useAnimationController(
      duration: const Duration(milliseconds: 900),
    );
    useEffect(() {
      entranceCtrl.forward();
      return null;
    }, const []);

    return Stack(
      children: [
        _HeaderBg(),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StaggerFade(
                    ctrl: entranceCtrl,
                    start: 0.0,
                    end: 0.35,
                    child: _StatusBadge(isSuccess: state.isSuccess)),
                const SizedBox(height: 22),
                _StaggerFade(
                    ctrl: entranceCtrl,
                    start: 0.1,
                    end: 0.5,
                    slideFrom: const Offset(0, 0.25),
                    child: _IconBox(isSuccess: state.isSuccess)),
                const SizedBox(height: 18),
                _StaggerFade(
                    ctrl: entranceCtrl,
                    start: 0.2,
                    end: 0.65,
                    slideFrom: const Offset(0, 0.2),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      child: Text(
                        state.isSuccess
                            ? locale.resetPasswordHeaderSuccessTitle
                            : locale.resetPasswordHeaderTitle,
                        key: ValueKey(state.isSuccess),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.8,
                          height: 1.1,
                        ),
                      ),
                    )),
                const SizedBox(height: 8),
                _StaggerFade(
                    ctrl: entranceCtrl,
                    start: 0.28,
                    end: 0.72,
                    slideFrom: const Offset(0, 0.15),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      child: Row(
                        key: ValueKey(state.isSuccess),
                        children: [
                          Text(
                            state.isSuccess
                                ? locale.resetPasswordHeaderSuccessSubtitle
                                : locale.resetPasswordHeaderSubtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB8B5D0),
                            ),
                          ),
                          Text(
                            state.isSuccess ? '🔓' : '🔐',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderBg extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(
      duration: const Duration(seconds: 7),
    )..repeat(reverse: true);
    final t = useAnimation(ctrl);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.46,
      child: CustomPaint(
        painter: _HeaderPainter(t: t),
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.46),
      ),
    );
  }
}

class _HeaderPainter extends CustomPainter {
  final double t;
  const _HeaderPainter({required this.t});

  @override
  void paint(Canvas canvas, Size size) {
    // Base gradient
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppTokens.headerGrad,
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Right orb
    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * (0.28 + t * 0.08)),
      size.width * 0.37,
      Paint()
        ..shader = RadialGradient(colors: [
          Colors.purple.withValues(alpha: 0.55),
          Colors.transparent,
        ]).createShader(Rect.fromCircle(
          center: Offset(size.width * 0.78, size.height * 0.3),
          radius: size.width * 0.37,
        )),
    );

    // Left orb
    canvas.drawCircle(
      Offset(size.width * 0.22, size.height * (0.55 - t * 0.05)),
      size.width * 0.27,
      Paint()
        ..shader = RadialGradient(colors: [
          AppTokens.orbBlue.withValues(alpha: 0.4),
          Colors.transparent,
        ]).createShader(Rect.fromCircle(
          center: Offset(size.width * 0.22, size.height * 0.55),
          radius: size.width * 0.27,
        )),
    );

    // Fade to bg at bottom
    final fadeR =
        Rect.fromLTWH(0, size.height * 0.58, size.width, size.height * 0.42);
    canvas.drawRect(
      fadeR,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppTokens.bgBase.withValues(alpha: 0.7),
            AppTokens.bgBase
          ],
        ).createShader(fadeR),
    );
  }

  @override
  bool shouldRepaint(_HeaderPainter old) => old.t != t;
}

class _StatusBadge extends HookWidget {
  final bool isSuccess;
  const _StatusBadge({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final pulseCtrl = useAnimationController(
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    final pulseOp = useAnimation(
      Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(parent: pulseCtrl, curve: Curves.easeInOut),
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: pulseOp,
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: isSuccess ? Colors.greenAccent : const Color(0xFFF59E0B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            isSuccess
                ? locale.resetPasswordHeaderStatusUpdated
                : locale.resetPasswordHeaderStatusCreate,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBox extends HookWidget {
  final bool isSuccess;
  const _IconBox({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    final floatCtrl = useAnimationController(
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
    final floatY = useAnimation(
      Tween<double>(begin: 0, end: -5).animate(
        CurvedAnimation(parent: floatCtrl, curve: Curves.easeInOut),
      ),
    );

    return Transform.translate(
      offset: Offset(0, floatY),
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
          boxShadow: [
            BoxShadow(
              color: AppTokens.orbPurple.withValues(alpha: 0.25),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => ScaleTransition(
              scale: anim, child: FadeTransition(opacity: anim, child: child)),
          child: Icon(
            isSuccess ? Icons.lock_open_rounded : Icons.lock_reset_rounded,
            key: ValueKey(isSuccess),
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _StaggerFade extends HookWidget {
  final AnimationController ctrl;
  final double start, end;
  final Offset slideFrom;
  final Widget child;

  const _StaggerFade({
    required this.ctrl,
    required this.start,
    required this.end,
    this.slideFrom = const Offset(0, 0.12),
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
    final slide = useAnimation(
      Tween<Offset>(begin: slideFrom, end: Offset.zero).animate(
        CurvedAnimation(
            parent: ctrl,
            curve: Interval(start, end, curve: Curves.easeOutCubic)),
      ),
    );
    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: SlideTransition(
        position: AlwaysStoppedAnimation(slide),
        child: child,
      ),
    );
  }
}
