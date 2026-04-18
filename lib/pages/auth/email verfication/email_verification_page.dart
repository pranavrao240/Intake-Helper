import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/router.dart';
import 'package:intake_helper/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

// ─── Page ────────────────────────────────────────────────────────────────────

class EmailVerificationPage extends StatelessWidget {
  final String email;
  const EmailVerificationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _Tokens.bgBase,
      body: Stack(
        children: [
          const _HeaderBackground(),
          Column(
            children: [
              const Expanded(flex: 42, child: _TopSection()),
              _BottomCard(email: email),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Header background (static gradient, no animation) ───────────────────────

class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height * 0.4;

    return SizedBox(
      height: h,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPainter(),
      ),
    );
  }
}

class _HeaderPainter extends CustomPainter {
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

    // Orb right-top (static)
    canvas.drawCircle(
      Offset(size.width * 0.78, size.height * 0.28),
      size.width * 0.38,
      Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFF8B3CF7).withValues(alpha: 0.55),
            Colors.transparent,
          ],
        ).createShader(Rect.fromCircle(
          center: Offset(size.width * 0.78, size.height * 0.28),
          radius: size.width * 0.38,
        )),
    );

    // Orb left-center (static)
    canvas.drawCircle(
      Offset(size.width * 0.25, size.height * 0.55),
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

    // Fade to bg at bottom
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
  bool shouldRepaint(_HeaderPainter old) => false; // never repaints
}

// ─── Top section ─────────────────────────────────────────────────────────────

class _TopSection extends StatelessWidget {
  const _TopSection();

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
            const _StatusBadge(),
            const SizedBox(height: 22),
            const _IconBox(),
            const SizedBox(height: 18),
            Text(
              locale.emailVerificationTitle,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.8,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 6),
            Row(
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
          ],
        ),
      ),
    );
  }
}

// ─── Status badge (static dot, no pulse) ─────────────────────────────────────

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
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: Color(0xFFF59E0B),
              shape: BoxShape.circle,
            ),
          ),
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

// ─── Icon box (static, no float) ─────────────────────────────────────────────

class _IconBox extends StatelessWidget {
  const _IconBox();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

// ─── Bottom card ─────────────────────────────────────────────────────────────

class _BottomCard extends StatelessWidget {
  final String email;
  const _BottomCard({required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          _EmailDisplayField(email: email),
          const SizedBox(height: 24),
          const _InfoText(),
          const SizedBox(height: 28),
          const _StepsRow(),
          const SizedBox(height: 28),
          _ContinueButton(
            onTap: () async {
              debugPrint('Continue button clicked');
              try {
                final preferences = await SharedPreferences.getInstance();
                debugPrint('SharedPreferences instance created');
                await preferences.remove('token');
                debugPrint('Token removed successfully');
                if (context.mounted) {
                  debugPrint('Context mounted, navigating to login');
                  context.go(RouteConstants.login.path);
                } else {
                  debugPrint('Context not mounted');
                }
              } catch (e) {
                debugPrint('Error in continue button: $e');
              }
            },
          ),
          const SizedBox(height: 16),
          const _OrDivider(),
          const SizedBox(height: 16),
          const _ResendRow(),
          const SizedBox(height: 20),
          const _Footer(),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}

// ─── Email display field ──────────────────────────────────────────────────────

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

// ─── Info text ────────────────────────────────────────────────────────────────

class _InfoText extends StatelessWidget {
  const _InfoText();

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

// ─── Steps row (static, no stagger animation) ────────────────────────────────

class _StepsRow extends StatelessWidget {
  const _StepsRow();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    final steps = [
      (Icons.inbox_rounded, locale.emailVerificationStepCheckInbox),
      (Icons.touch_app_rounded, locale.emailVerificationStepClickLink),
      (Icons.verified_rounded, locale.emailVerificationStepVerified),
    ];

    return Row(
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          return const Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Divider(color: _Tokens.inputBorder, thickness: 1),
            ),
          );
        }
        final idx = i ~/ 2;
        final isLast = idx == steps.length - 1;
        return _Step(
          icon: steps[idx].$1,
          label: steps[idx].$2,
          isLast: isLast,
        );
      }),
    );
  }
}

class _Step extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isLast;

  const _Step({
    required this.icon,
    required this.label,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

// ─── Continue button (no shim animation) ─────────────────────────────────────

class _ContinueButton extends StatelessWidget {
  final VoidCallback onTap;
  const _ContinueButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    debugPrint('Continue button building');

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              color: const Color(0xFF6B3FD4).withOpacity(0.45),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
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
      ),
    );
  }
}

// ─── Or divider ───────────────────────────────────────────────────────────────

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Row(
      children: [
        const Expanded(
            child: Divider(color: _Tokens.inputBorder, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            locale.emailVerificationOrContinueWith,
            style: const TextStyle(fontSize: 12, color: _Tokens.textMuted),
          ),
        ),
        const Expanded(
            child: Divider(color: _Tokens.inputBorder, thickness: 1)),
      ],
    );
  }
}

// ─── Resend row (countdown only, no animation) ───────────────────────────────

class _ResendRow extends HookConsumerWidget {
  const _ResendRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cooldown = useState(30);
    final hasSent = useState(false);
    final locale = AppLocalizations.of(context)!;

    useEffect(() {
      StreamSubscription? sub;
      sub = Stream.periodic(const Duration(seconds: 1)).listen((_) {
        if (cooldown.value > 0) {
          cooldown.value--;
          if (cooldown.value == 0) sub?.cancel();
        }
      });
      return () => sub?.cancel();
    }, const []);

    final canResend = cooldown.value == 0 && !hasSent.value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          locale.emailVerificationDidNotReceive,
          style: const TextStyle(fontSize: 13, color: _Tokens.textSecondary),
        ),
        GestureDetector(
          onTap: canResend
              ? () {
                  hasSent.value = true;
                  cooldown.value = 30;
                }
              : null,
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
      ],
    );
  }
}

// ─── Countdown chip ───────────────────────────────────────────────────────────

class _CountdownChip extends StatelessWidget {
  final int seconds;
  const _CountdownChip({required this.seconds});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 14,
          height: 14,
          child: CustomPaint(
            painter: _RingPainter(progress: seconds / 30.0),
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

// ─── Footer ───────────────────────────────────────────────────────────────────

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
          style: const TextStyle(fontSize: 13, color: _Tokens.textSecondary),
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
