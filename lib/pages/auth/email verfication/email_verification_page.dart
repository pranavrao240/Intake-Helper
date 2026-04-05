import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class _Tokens {
  static const bgBase = Color(0xFF12111A);
  static const cardBg = Color(0xFF1C1B26);
  static const inputBg = Color(0xFF252333);
  static const inputBorder = Color(0xFF2E2C3E);

  static const btnLeft = Color(0xFF4A3AE8);
  static const btnRight = Color(0xFF8B3CF7);

  static const textSecondary = Color(0xFF9794B0);
  static const textMuted = Color(0xFF5C5A75);
}

class EmailVerificationPage extends HookConsumerWidget {
  final String email;

  const EmailVerificationPage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final masterCtrl = useAnimationController(
      duration: const Duration(milliseconds: 1600),
    );

    useEffect(() {
      masterCtrl.forward();
      return null;
    }, const []);

    return Scaffold(
      backgroundColor: _Tokens.bgBase,
      body: Stack(
        children: [
          _HeaderBackground(),
          Column(
            children: [
              Expanded(
                flex: 42,
                child: _TopSection(masterCtrl: masterCtrl),
              ),
              _BottomCard(
                email: email,
                masterCtrl: masterCtrl,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderBackground extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(
      duration: const Duration(seconds: 7),
    )..repeat(reverse: true);
    final anim = useAnimation(ctrl);

    return LayoutBuilder(builder: (context, constraints) {
      final h = MediaQuery.of(context).size.height * 0.48;
      return SizedBox(
        height: h,
        child: CustomPaint(
          painter: _HeaderPainter(progress: anim),
          size: Size(constraints.maxWidth, h),
        ),
      );
    });
  }
}

class _HeaderPainter extends CustomPainter {
  final double progress;
  _HeaderPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Base gradient
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A1FA8), Color(0xFF5B2EC0), Color(0xFF3B1E9E)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Soft orb right-top
    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * (0.28 + progress * 0.08)),
      size.width * 0.38,
      Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFF8B3CF7).withValues(alpha: 0.55),
            Colors.transparent,
          ],
        ).createShader(Rect.fromCircle(
          center: Offset(size.width * 0.78, size.height * 0.3),
          radius: size.width * 0.38,
        )),
    );

    // Soft orb left-center
    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * (0.55 - progress * 0.05)),
      size.width * 0.28,
      Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFF4A3AE8).withValues(alpha: 0.4),
            Colors.transparent,
          ],
        ).createShader(Rect.fromCircle(
          center: Offset(size.width * 0.25, size.height * 0.55),
          radius: size.width * 0.28,
        )),
    );

    final fadeRect =
        Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4);
    canvas.drawRect(
      fadeRect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            const Color(0xFF12111A).withValues(alpha: 0.6),
            const Color(0xFF12111A),
          ],
        ).createShader(fadeRect),
    );
  }

  @override
  bool shouldRepaint(_HeaderPainter old) => old.progress != progress;
}

class _TopSection extends HookWidget {
  final AnimationController masterCtrl;
  const _TopSection({required this.masterCtrl});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _StaggerFade(
              ctrl: masterCtrl,
              start: 0.0,
              end: 0.3,
              child: const _StatusBadge(),
            ),
            const SizedBox(height: 22),
            _StaggerFade(
              ctrl: masterCtrl,
              start: 0.05,
              end: 0.4,
              slideFrom: const Offset(0, 0.25),
              child: _IconBox(),
            ),
            const SizedBox(height: 18),
            _StaggerFade(
              ctrl: masterCtrl,
              start: 0.12,
              end: 0.5,
              slideFrom: const Offset(0, 0.2),
              child: Text(
                locale.emailVerificationTitle,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.8,
                  height: 1.1,
                ),
              ),
            ),
            const SizedBox(height: 6),
            _StaggerFade(
              ctrl: masterCtrl,
              start: 0.18,
              end: 0.55,
              slideFrom: const Offset(0, 0.15),
              child: Row(
                children: [
                  Text(
                    locale.emailVerificationCheckInbox,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFB8B5D0),
                    ),
                  ),
                  const Text('📬', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PulsingDot(),
          const SizedBox(width: 6),
          Text(
            locale.emailVerificationPending,
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

class _PulsingDot extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    final opacity = useAnimation(
      Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(parent: ctrl, curve: Curves.easeInOut),
      ),
    );
    return Opacity(
      opacity: opacity,
      child: Container(
        width: 7,
        height: 7,
        decoration: const BoxDecoration(
          color: Color(0xFFF59E0B),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _IconBox extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final floatCtrl = useAnimationController(
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
    final floatAnim = useAnimation(
      Tween<double>(begin: 0, end: -5).animate(
        CurvedAnimation(parent: floatCtrl, curve: Curves.easeInOut),
      ),
    );

    return Transform.translate(
      offset: Offset(0, floatAnim),
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.15)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8B3CF7).withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(
          Icons.mark_email_read_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class _BottomCard extends HookConsumerWidget {
  final String email;
  final AnimationController masterCtrl;

  const _BottomCard({required this.email, required this.masterCtrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardSlide = useAnimation(
      Tween<Offset>(begin: const Offset(0, 0.18), end: Offset.zero).animate(
        CurvedAnimation(
          parent: masterCtrl,
          curve: const Interval(0.25, 0.75, curve: Curves.easeOutCubic),
        ),
      ),
    );
    final cardFade = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: masterCtrl,
          curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
        ),
      ),
    );

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(cardFade),
      child: SlideTransition(
        position: AlwaysStoppedAnimation(cardSlide),
        child: Container(
          decoration: const BoxDecoration(
            color: _Tokens.cardBg,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _StaggerFade(
                ctrl: masterCtrl,
                start: 0.35,
                end: 0.65,
                child: _EmailDisplayField(email: email),
              ),
              const SizedBox(height: 24),
              _StaggerFade(
                ctrl: masterCtrl,
                start: 0.42,
                end: 0.72,
                child: _InfoText(),
              ),
              const SizedBox(height: 28),
              _StaggerFade(
                ctrl: masterCtrl,
                start: 0.5,
                end: 0.8,
                child: const _StepsRow(),
              ),
              const SizedBox(height: 28),
              _StaggerFade(
                ctrl: masterCtrl,
                start: 0.58,
                end: 0.88,
                child: _ContinueButton(
                  onTap: () => context.go(RouteConstants.login.path),
                ),
              ),
              const SizedBox(height: 16),
              _StaggerFade(
                ctrl: masterCtrl,
                start: 0.65,
                end: 0.9,
                child: const _OrDivider(),
              ),
              const SizedBox(height: 16),
              _StaggerFade(
                ctrl: masterCtrl,
                start: 0.7,
                end: 0.95,
                child: const _ResendRow(),
              ),
              const SizedBox(height: 20),
              _StaggerFade(
                ctrl: masterCtrl,
                start: 0.75,
                end: 1.0,
                child: const _Footer(),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailDisplayField extends StatelessWidget {
  final String email;
  const _EmailDisplayField({required this.email});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locale.emailVerificationEmailLabel,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: _Tokens.textMuted,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: _Tokens.inputBg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: const Color(0xFF6B3FD4).withValues(alpha: 0.5)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6B3FD4).withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.mail_outline_rounded,
                  color: _Tokens.textSecondary, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF6B3FD4).withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xFF8B3CF7).withValues(alpha: 0.35),
                  ),
                ),
                child: Text(
                  locale.emailVerificationSent,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA78BFA),
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

class _InfoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF252333),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _Tokens.inputBorder),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline_rounded,
              size: 16, color: Color(0xFF9B8FE0)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              locale.emailVerificationLinkSent,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.55),
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepsRow extends HookWidget {
  const _StepsRow();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    final _steps = [
      (Icons.inbox_rounded, locale.emailVerificationStepCheckInbox),
      (Icons.touch_app_rounded, locale.emailVerificationStepClickLink),
      (Icons.verified_rounded, locale.emailVerificationStepVerified),
    ];
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 900),
    );
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 700), ctrl.forward);
      return null;
    }, const []);

    return Row(
      children: List.generate(_steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          return Expanded(
              child: _Connector(ctrl: ctrl, delay: 0.2 + (i ~/ 2) * 0.25));
        }
        final idx = i ~/ 2;
        return _Step(
          icon: _steps[idx].$1,
          label: _steps[idx].$2,
          index: idx,
          ctrl: ctrl,
        );
      }),
    );
  }
}

class _Step extends HookWidget {
  final IconData icon;
  final String label;
  final int index;
  final AnimationController ctrl;

  const _Step({
    required this.icon,
    required this.label,
    required this.index,
    required this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    final d = index * 0.22;
    final e = (d + 0.4).clamp(0.0, 1.0);
    final scale = useAnimation(
      CurvedAnimation(
        parent: ctrl,
        curve: Interval(d, e, curve: Curves.elasticOut),
      ),
    );
    final fade = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: ctrl, curve: Interval(d, e, curve: Curves.easeOut)),
      ),
    );

    final isLast = index == 2;

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fade),
      child: Transform.scale(
        scale: 0.5 + scale * 0.5,
        child: Column(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                gradient: isLast
                    ? const LinearGradient(
                        colors: [Color(0xFF22C55E), Color(0xFF15803D)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: isLast ? null : _Tokens.inputBg,
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: isLast
                      ? const Color(0xFF22C55E).withOpacity(0.4)
                      : _Tokens.inputBorder,
                ),
                boxShadow: isLast
                    ? [
                        BoxShadow(
                          color: const Color(0xFF22C55E).withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                icon,
                size: 20,
                color: isLast ? Colors.white : _Tokens.textSecondary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isLast ? const Color(0xFF4ADE80) : _Tokens.textSecondary,
                fontWeight: isLast ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Connector extends HookWidget {
  final AnimationController ctrl;
  final double delay;
  const _Connector({required this.ctrl, required this.delay});

  @override
  Widget build(BuildContext context) {
    final p = useAnimation(
      Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: ctrl,
          curve:
              Interval(delay, (delay + 0.3).clamp(0, 1), curve: Curves.easeOut),
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: p,
          child: Container(
            height: 1,
            color: _Tokens.inputBorder,
          ),
        ),
      ),
    );
  }
}

class _ContinueButton extends HookConsumerWidget {
  final VoidCallback onTap;
  const _ContinueButton({required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = useState(false);
    final locale = AppLocalizations.of(context)!;

    final shimCtrl = useAnimationController(
      duration: const Duration(milliseconds: 1800),
    )..repeat();
    final shimAnim = useAnimation(shimCtrl);

    return GestureDetector(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) {
        isPressed.value = false;
        onTap();
      },
      onTapCancel: () => isPressed.value = false,
      child: AnimatedScale(
        scale: isPressed.value ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 58,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [_Tokens.btnLeft, _Tokens.btnRight],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6B3FD4).withOpacity(
                  isPressed.value ? 0.2 : 0.45,
                ),
                blurRadius: isPressed.value ? 10 : 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Transform.translate(
                    offset: Offset((shimAnim * 2 - 0.5) * 420, 0),
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    locale.emailVerificationGoToLogin,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
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

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(child: Divider(color: _Tokens.inputBorder, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            locale.emailVerificationOrContinueWith,
            style: const TextStyle(
              fontSize: 12,
              color: _Tokens.textMuted,
            ),
          ),
        ),
        Expanded(child: Divider(color: _Tokens.inputBorder, thickness: 1)),
      ],
    );
  }
}

class _ResendRow extends HookConsumerWidget {
  const _ResendRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cooldown = useState(30);
    final hasSent = useState(false);
    final isPressed = useState(false);
    final locale = AppLocalizations.of(context)!;

    useEffect(() {
      final s = Stream.periodic(const Duration(seconds: 1));
      final sub = s.listen((_) {
        if (cooldown.value > 0) cooldown.value--;
      });
      return sub.cancel;
    }, const []);

    final canResend = cooldown.value == 0 && !hasSent.value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          locale.emailVerificationDidNotReceive,
          style: const TextStyle(
            fontSize: 13,
            color: _Tokens.textSecondary,
          ),
        ),
        GestureDetector(
          onTapDown: canResend ? (_) => isPressed.value = true : null,
          onTapUp: canResend
              ? (_) {
                  isPressed.value = false;
                  hasSent.value = true;
                  cooldown.value = 30;
                }
              : null,
          onTapCancel: () => isPressed.value = false,
          child: AnimatedScale(
            scale: isPressed.value ? 0.93 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: hasSent.value
                ? Text(
                    locale.emailVerificationResent,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4ADE80),
                    ),
                  )
                : cooldown.value > 0
                    ? _CountdownChip(seconds: cooldown.value)
                    : Text(
                        locale.emailVerificationResend,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFE31E24),
                        ),
                      ),
          ),
        ),
      ],
    );
  }
}

class _CountdownChip extends HookWidget {
  final int seconds;
  const _CountdownChip({required this.seconds});

  @override
  Widget build(BuildContext context) {
    final progress = seconds / 30.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 14,
          height: 14,
          child: CustomPaint(
            painter: _RingPainter(progress: progress),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '${seconds}s',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: _Tokens.textMuted,
          ),
        ),
      ],
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  const _RingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2 - 1;
    final p = Paint()
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(c, r, p..color = _Tokens.inputBorder);
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: r),
      -math.pi / 2,
      progress * 2 * math.pi,
      false,
      p..color = const Color(0xFF6B3FD4),
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          locale.emailVerificationNeedHelp,
          style: const TextStyle(
            fontSize: 13,
            color: _Tokens.textSecondary,
          ),
        ),
        Text(
          locale.emailVerificationContactSupport,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xFFE31E24),
          ),
        ),
      ],
    );
  }
}

class _StaggerFade extends HookWidget {
  final AnimationController ctrl;
  final double start;
  final double end;
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
          parent: ctrl,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      ),
    );
    final slide = useAnimation(
      Tween<Offset>(begin: slideFrom, end: Offset.zero).animate(
        CurvedAnimation(
          parent: ctrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
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
